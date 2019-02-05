//
//  AppDelegate.swift
//  Kinit
//

import Fabric
import Crashlytics
import UIKit
import KinCoreSDK
import Firebase
import FirebaseAuth
import MoveKin

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var notificationHandler: NotificationHandler?
    var lastBackgroundRefreshStatus: UIBackgroundRefreshStatus!
    let moveKinFlow = MoveKinFlow()
    let rootViewController = RootViewController()

    //swiftlint:disable:next line_length
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if !runningTests() {
            Fabric.with([Crashlytics.self])

            #if !TESTS
            if let testFairyKey = Configuration.shared.testFairyKey {
                TestFairy.begin(testFairyKey)
            }
            #endif
        }

        moveKinFlow.sendDelegate = self
        moveKinFlow.receiveDelegate = self

        lastBackgroundRefreshStatus = application.backgroundRefreshStatus
        AuthToken.prepare()

        let filePath = Bundle.main.path(forResource: firebaseFileName(), ofType: "plist")!
        let firebaseOptions = FirebaseOptions(contentsOfFile: filePath)!
        FirebaseApp.configure(options: firebaseOptions)

        #if DEBUG
            logLevel = .debug
        #endif

        if #available(iOS 10.0, *) {
            notificationHandler = iOS10NotificationHandler()
        }

        applyAppearance()

        let currentUser = User.current
        Analytics.start(userId: currentUser?.userId, deviceId: currentUser?.deviceId)

        window = UIWindow()
        window!.makeKeyAndVisible()
        window!.rootViewController = rootViewController
        rootViewController.appLaunched()

        notificationHandler?.arePermissionsGranted { granted in
            Analytics.setUserProperty(Events.UserProperties.pushEnabled, with: granted)
        }

        if
            let launchOptions = launchOptions,
            let notificationUserInfo = launchOptions[.remoteNotification] as? [AnyHashable: Any] {
            PushHandler.handlePush(with: notificationUserInfo)
        }

        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        let newBackgroundRefreshStatus = application.backgroundRefreshStatus

        if lastBackgroundRefreshStatus != .available && newBackgroundRefreshStatus == .available {
            application.registerForRemoteNotifications()
            WebRequests.appLaunch().load(with: KinWebService.shared)
        }

        lastBackgroundRefreshStatus = newBackgroundRefreshStatus
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        User.current?.updateDeviceTokenIfNeeded(deviceToken.hexString)

        let tokenType: AuthAPNSTokenType

        #if DEBUG
        tokenType = .sandbox
        #else
        tokenType = .prod
        #endif

        Auth.auth().setAPNSToken(deviceToken, type: tokenType)
    }

    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        KLogVerbose("Received push:\n\(userInfo)")

        if Auth.auth().canHandleNotification(userInfo) {
            completionHandler(.noData)
            return
        }

        PushHandler.handlePush(with: userInfo)
    }

    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        print("Should handle \(url.absoluteString)")

        if let sourceApp = options[.sourceApplication] as? String,
            moveKinFlow.canHandleURL(url) {
            moveKinFlow.handleURL(url, from: sourceApp)
        }

        return true
    }
}

extension AppDelegate {
    @discardableResult func dismissSplashIfNeeded() -> Bool {
        return rootViewController.dismissSplashIfNeeded()
    }

    var isShowingSplashScreen: Bool {
        return rootViewController.isShowingSplashScreen
    }
}

private func runningTests() -> Bool {
    return ProcessInfo().environment["XCInjectBundleInto"] != nil
}
