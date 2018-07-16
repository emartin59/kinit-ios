// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {
  /// Your account is ready!
  static let accountReadyMessage = L10n.tr("Localizable", "AccountReadyMessage")
  /// Woohooooo
  static let accountReadyTitle = L10n.tr("Localizable", "AccountReadyTitle")
  /// Continue
  static let activityActionContinue = L10n.tr("Localizable", "ActivityActionContinue")
  /// Start Earning Kin
  static let activityActionStart = L10n.tr("Localizable", "ActivityActionStart")
  /// by %@
  static func activityAuthor(_ p1: String) -> String {
    return L10n.tr("Localizable", "ActivityAuthor", p1)
  }
  /// You have completed today's activity.
  static let activityDoneMessage = L10n.tr("Localizable", "ActivityDoneMessage")
  /// Awesome!
  static let activityDoneTitle = L10n.tr("Localizable", "ActivityDoneTitle")
  /// Back to Spend
  static let backToSpendAction = L10n.tr("Localizable", "BackToSpendAction")
  /// My Vouchers
  static let balanceMyVouchers = L10n.tr("Localizable", "BalanceMyVouchers")
  /// Recent Actions
  static let balanceRecentActions = L10n.tr("Localizable", "BalanceRecentActions")
  /// Buy
  static let buy = L10n.tr("Localizable", "Buy")
  /// Cancel
  static let cancel = L10n.tr("Localizable", "Cancel")
  /// Close
  static let closeAction = L10n.tr("Localizable", "CloseAction")
  /// Code saved to My Vouchers
  static let couponCodeSaved = L10n.tr("Localizable", "CouponCodeSaved")
  /// EmailUs
  static let emailUs = L10n.tr("Localizable", "EmailUs")
  /// We are hand-picking the best for you!
  static let emptyOffersSubtitle = L10n.tr("Localizable", "EmptyOffersSubtitle")
  /// No offers at the moment
  static let emptyOffersTitle = L10n.tr("Localizable", "EmptyOffersTitle")
  /// Please check your internet connection and try again.
  static let internetErrorMessage = L10n.tr("Localizable", "InternetErrorMessage")
  /// Oh no! Your internet is MIA
  static let internetErrorTitle = L10n.tr("Localizable", "InternetErrorTitle")
  /// Kin delivered!
  static let kinDelivered = L10n.tr("Localizable", "KinDelivered")
  /// You’ve succesfully sent K %@.\nYou can see the details under Balance
  static func kinSentMessage(_ p1: String) -> String {
    return L10n.tr("Localizable", "KinSentMessage", p1)
  }
  /// Please check back later
  static let lastOfferGrabbedMessage = L10n.tr("Localizable", "LastOfferGrabbedMessage")
  /// Oops! Someone grabbed the last one... for now
  static let lastOfferGrabbedTitle = L10n.tr("Localizable", "LastOfferGrabbedTitle")
  /// Add an email account to your device in order to send email.
  static let mailNotConfiguredErrorMessage = L10n.tr("Localizable", "MailNotConfiguredErrorMessage")
  /// Mail Not Configured
  static let mailNotConfiguredErrorTitle = L10n.tr("Localizable", "MailNotConfiguredErrorTitle")
  /// Next
  static let nextAction = L10n.tr("Localizable", "NextAction")
  /// We have planted the seed and your next task is currently growing
  static let nextActivityOnSubtitle = L10n.tr("Localizable", "NextActivityOnSubtitle")
  /// Your next activity will be available %@
  static func nextActivityOnTitle(_ p1: String) -> String {
    return L10n.tr("Localizable", "NextActivityOnTitle", p1)
  }
  /// We are laying the groundwork for your next task.\nStay tuned :)
  static let noActivitiesMessage = L10n.tr("Localizable", "NoActivitiesMessage")
  /// No activities at the moment
  static let noActivitiesTitle = L10n.tr("Localizable", "NoActivitiesTitle")
  /// It seems that something is missing...\nPlease check your internet connection.
  static let noInternetErrorSubtitle = L10n.tr("Localizable", "NoInternetErrorSubtitle")
  /// Your internet is MIA
  static let noInternetErrorTitle = L10n.tr("Localizable", "NoInternetErrorTitle")
  /// Open Settings
  static let notificationsDeniedAction = L10n.tr("Localizable", "NotificationsDeniedAction")
  /// Push notification permissions were previously denied and are currently turned off.\nPlease go to settings to turn on notifications.
  static let notificationsDeniedMessage = L10n.tr("Localizable", "NotificationsDeniedMessage")
  /// Please Allow Notifications
  static let notificationsDeniedTitle = L10n.tr("Localizable", "NotificationsDeniedTitle")
  /// Notify Me
  static let notifyMe = L10n.tr("Localizable", "NotifyMe")
  /// OK
  static let ok = L10n.tr("Localizable", "OK")
  /// Or
  static let or = L10n.tr("Localizable", "Or")
  /// or contact support
  static let orContactSupport = L10n.tr("Localizable", "OrContactSupport")
  /// Send me a new code
  static let phoneConfirmationAskNewCode = L10n.tr("Localizable", "PhoneConfirmationAskNewCode")
  /// The code should arrive in %ds.
  static func phoneConfirmationCountdown(_ p1: Int) -> String {
    return L10n.tr("Localizable", "PhoneConfirmationCountdown", p1)
  }
  /// We have sent you a verification code to your phone. Please type it below:
  static let phoneConfirmationMessage = L10n.tr("Localizable", "PhoneConfirmationMessage")
  /// Verification SMS
  static let phoneConfirmationTitle = L10n.tr("Localizable", "PhoneConfirmationTitle")
  /// We have sent a verification code to %@. Please type it below:
  static func phoneVerificationCodeSent(_ p1: String) -> String {
    return L10n.tr("Localizable", "PhoneVerificationCodeSent", p1)
  }
  /// Something wrong happened. Please check your internet connection
  static let phoneVerificationRequestGeneralError = L10n.tr("Localizable", "PhoneVerificationRequestGeneralError")
  /// Invalid phone number
  static let phoneVerificationRequestInvalidNumber = L10n.tr("Localizable", "PhoneVerificationRequestInvalidNumber")
  /// Your phone number is used to identify your wallet.
  static let phoneVerificationRequestMessage = L10n.tr("Localizable", "PhoneVerificationRequestMessage")
  /// Phone Number
  static let phoneVerificationRequestTitle = L10n.tr("Localizable", "PhoneVerificationRequestTitle")
  /// Hi! 👋\nReady to earn some Kin?
  static let readyToEarnKinQuestion = L10n.tr("Localizable", "ReadyToEarnKinQuestion")
  /// Sending Kin
  static let sendingKin = L10n.tr("Localizable", "SendingKin")
  /// Send Kin
  static let sendKinAction = L10n.tr("Localizable", "SendKinAction")
  /// Maybe send your friends to the app store?
  static let sendKinContactNotFoundErrorMessage = L10n.tr("Localizable", "SendKinContactNotFoundErrorMessage")
  /// Sorry, you can only send Kin to Kinit users.
  static let sendKinContactNotFoundErrorTitle = L10n.tr("Localizable", "SendKinContactNotFoundErrorTitle")
  /// You can only send %u KIN at a time.
  static func sendKinHighAmountErrorMessage(_ p1: Int) -> String {
    return L10n.tr("Localizable", "SendKinHighAmountErrorMessage", p1)
  }
  /// That's Very Kind
  static let sendKinHighAmountErrorTitle = L10n.tr("Localizable", "SendKinHighAmountErrorTitle")
  /// Please send at least %u KIN.
  static func sendKinLowAmountErrorMessage(_ p1: Int) -> String {
    return L10n.tr("Localizable", "SendKinLowAmountErrorMessage", p1)
  }
  /// How About a Bit More Love?
  static let sendKinLowAmountErrorTitle = L10n.tr("Localizable", "SendKinLowAmountErrorTitle")
  /// Make sure you have at least %u KIN.
  static func sendKinLowBalanceErrorMessage(_ p1: Int) -> String {
    return L10n.tr("Localizable", "SendKinLowBalanceErrorMessage", p1)
  }
  /// Looks Like Your Balance Is a Bit Low
  static let sendKinLowBalanceErrorTitle = L10n.tr("Localizable", "SendKinLowBalanceErrorTitle")
  /// Please try again later. If you continue to see this message, please reach out to support.
  static let sendKinTransactionFailedErrorMessage = L10n.tr("Localizable", "SendKinTransactionFailedErrorMessage")
  /// Houston We Have a Server Problem
  static let sendKinTransactionFailedErrorTitle = L10n.tr("Localizable", "SendKinTransactionFailedErrorTitle")
  /// To
  static let sendTo = L10n.tr("Localizable", "SendTo")
  /// Spend your Kin
  static let spendYourKin = L10n.tr("Localizable", "SpendYourKin")
  /// Support
  static let support = L10n.tr("Localizable", "Support")
  /// Tap to finish
  static let tapToFinish = L10n.tr("Localizable", "TapToFinish")
  /// To make sure you get your Kin, hit close below and continue on the next screen.
  static let taskSubmissionFailedErrorMessage = L10n.tr("Localizable", "TaskSubmissionFailedErrorMessage")
  /// There was a problem submitting your answers
  static let taskSubmissionFailedErrorTitle = L10n.tr("Localizable", "TaskSubmissionFailedErrorTitle")
  ///  Sorry! We were unable to retrieve your code.\nPlease contact support to resolve this issue.
  static let transactionIncompleteMessage = L10n.tr("Localizable", "TransactionIncompleteMessage")
  /// Oops! Transaction incomplete
  static let transactionIncompleteTitle = L10n.tr("Localizable", "TransactionIncompleteTitle")
  /// Your transactions will appear here!
  static let transactionsEmptyStateMessage = L10n.tr("Localizable", "TransactionsEmptyStateMessage")
  /// Your new balance
  static let transferringKinNewBalance = L10n.tr("Localizable", "TransferringKinNewBalance")
  /// Your Kin is on it's way
  static let transferringKinOnItsWay = L10n.tr("Localizable", "TransferringKinOnItsWay")
  /// Try Again
  static let tryAgain = L10n.tr("Localizable", "TryAgain")
  /// Your vouchers will be saved here!
  static let vouchersEmptyStateMessage = L10n.tr("Localizable", "VouchersEmptyStateMessage")
  /// Please check your internet connection & try again.
  static let walletCreationErrorSubtitle = L10n.tr("Localizable", "WalletCreationErrorSubtitle")
  /// We were unable to create a wallet for you
  static let walletCreationErrorTitle = L10n.tr("Localizable", "WalletCreationErrorTitle")
  /// Earn Kin by completing fun daily activities, and enjoy it toward brown paper packages tied up with string (aka travel, movies, music, and more).
  static let welcome1stScreenMessage = L10n.tr("Localizable", "Welcome1stScreenMessage")
  ///  Welcome to Kinit
  static let welcome1stScreenTitle = L10n.tr("Localizable", "Welcome1stScreenTitle")
  /// Earning Kin is just like playing a game, only better, because you get rewarded for your time.
  static let welcome2ndScreenMessage = L10n.tr("Localizable", "Welcome2ndScreenMessage")
  /// Earn Kin
  static let welcome2ndScreenTitle = L10n.tr("Localizable", "Welcome2ndScreenTitle")
  /// In no time, you’ll have enough Kin to use towards great experiences or to share with your friends.
  static let welcome3rdScreenMessage = L10n.tr("Localizable", "Welcome3rdScreenMessage")
  /// Enjoy
  static let welcome3rdScreenTitle = L10n.tr("Localizable", "Welcome3rdScreenTitle")
  /// By clicking "Start earning Kin" you are agreeing\nto our Terms of Service and Privacy Policy
  static let welcomeScreenDisclaimer = L10n.tr("Localizable", "WelcomeScreenDisclaimer")
  /// Your Kin Balance
  static let yourKinBalance = L10n.tr("Localizable", "YourKinBalance")
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}