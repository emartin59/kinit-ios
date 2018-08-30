// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  internal typealias AssetColorTypeAlias = NSColor
  internal typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  internal typealias AssetColorTypeAlias = UIColor
  internal typealias Image = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

@available(*, deprecated, renamed: "ImageAsset")
internal typealias AssetType = ImageAsset

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  internal var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

internal struct ColorAsset {
  internal fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  internal var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let backupDoneIcon = ImageAsset(name: "BackupDoneIcon")
  internal static let backupIntroIllustration = ImageAsset(name: "BackupIntroIllustration")
  internal static let backupToDoIcon = ImageAsset(name: "BackupToDoIcon")
  internal static let buttonStroke = ImageAsset(name: "ButtonStroke")
  internal static let closeXButton = ImageAsset(name: "CloseXButton")
  internal static let closeXButtonDarkGray = ImageAsset(name: "CloseXButtonDarkGray")
  internal static let confettiDiamond = ImageAsset(name: "ConfettiDiamond")
  internal static let confettiNormal = ImageAsset(name: "ConfettiNormal")
  internal static let confettiStar = ImageAsset(name: "ConfettiStar")
  internal static let confettiTriangle = ImageAsset(name: "ConfettiTriangle")
  internal static let doneFireworks = ImageAsset(name: "DoneFireworks")
  internal static let doneSign = ImageAsset(name: "DoneSign")
  internal static let dualImageSeparator = ImageAsset(name: "DualImageSeparator")
  internal static let emailAlert = ImageAsset(name: "EmailAlert")
  internal static let emptyHistoryCoupon = ImageAsset(name: "EmptyHistoryCoupon")
  internal static let errorSign = ImageAsset(name: "ErrorSign")
  internal static let floorShadow = ImageAsset(name: "FloorShadow")
  internal static let historyCouponIcon = ImageAsset(name: "HistoryCouponIcon")
  internal static let historyCouponLine = ImageAsset(name: "HistoryCouponLine")
  internal static let historyKinIcon = ImageAsset(name: "HistoryKinIcon")
  internal static let historyShareButton = ImageAsset(name: "HistoryShareButton")
  internal static let imageOnlyAnswerBackground = ImageAsset(name: "ImageOnlyAnswerBackground")
  internal static let imageTextAnswerBackground = ImageAsset(name: "ImageTextAnswerBackground")
  internal static let imageTextAnswerBackgroundSelected = ImageAsset(name: "ImageTextAnswerBackgroundSelected")
  internal static let kinCoin = ImageAsset(name: "KinCoin")
  internal static let kinLogoSplash = ImageAsset(name: "KinLogoSplash")
  internal static let kinReward = ImageAsset(name: "KinReward")
  internal static let kinTaskReward = ImageAsset(name: "KinTaskReward")
  internal static let kinTaskTime = ImageAsset(name: "KinTaskTime")
  internal static let kinTransactionCoins = ImageAsset(name: "KinTransactionCoins")
  internal static let moreSupportIcon = ImageAsset(name: "MoreSupportIcon")
  internal static let moreTabIcon = ImageAsset(name: "MoreTabIcon")
  internal static let moreWalletBackupIcon = ImageAsset(name: "MoreWalletBackupIcon")
  internal static let multipleAnswerBackground = ImageAsset(name: "MultipleAnswerBackground")
  internal static let multipleAnswerBackgroundSelected = ImageAsset(name: "MultipleAnswerBackgroundSelected")
  internal static let multipleAnswerCheckmark = ImageAsset(name: "MultipleAnswerCheckmark")
  internal static let multipleAnswerPlus = ImageAsset(name: "MultipleAnswerPlus")
  internal static let nextTask = ImageAsset(name: "NextTask")
  internal static let noInternetIllustration = ImageAsset(name: "NoInternetIllustration")
  internal static let noOffers = ImageAsset(name: "NoOffers")
  internal static let offerCardShadow = ImageAsset(name: "OfferCardShadow")
  internal static let patternPlaceholder = ImageAsset(name: "PatternPlaceholder")
  internal static let paymentDelay = ImageAsset(name: "PaymentDelay")
  internal static let pickerArrow = ImageAsset(name: "PickerArrow")
  internal static let progressViewGradient = ImageAsset(name: "ProgressViewGradient")
  internal static let progressViewTrack = ImageAsset(name: "ProgressViewTrack")
  internal static let quizConfettiOval = ImageAsset(name: "QuizConfettiOval")
  internal static let quizConfettiRectangle = ImageAsset(name: "QuizConfettiRectangle")
  internal static let quizConfettiTriangle = ImageAsset(name: "QuizConfettiTriangle")
  internal static let recordsLedger = ImageAsset(name: "RecordsLedger")
  internal static let redeemBubble = ImageAsset(name: "RedeemBubble")
  internal static let smallHeart = ImageAsset(name: "SmallHeart")
  internal static let sowingIllustration = ImageAsset(name: "SowingIllustration")
  internal static let splashScreenBackground = ImageAsset(name: "SplashScreenBackground")
  internal static let tabBarBalance = ImageAsset(name: "TabBarBalance")
  internal static let tabBarEarn = ImageAsset(name: "TabBarEarn")
  internal static let tabBarMore = ImageAsset(name: "TabBarMore")
  internal static let tabBarSpend = ImageAsset(name: "TabBarSpend")
  internal static let textAnswerShape = ImageAsset(name: "TextAnswerShape")
  internal static let textAnswerShapeSelected = ImageAsset(name: "TextAnswerShapeSelected")
  internal static let timer = ImageAsset(name: "Timer")
  internal static let transferFireworks = ImageAsset(name: "TransferFireworks")
  internal static let walletCreationFailed = ImageAsset(name: "WalletCreationFailed")
  internal static let welcomeTutorial1 = ImageAsset(name: "WelcomeTutorial1")
  internal static let welcomeTutorial2 = ImageAsset(name: "WelcomeTutorial2")
  internal static let welcomeTutorial3 = ImageAsset(name: "WelcomeTutorial3")
  internal static let whiteCheckmark = ImageAsset(name: "WhiteCheckmark")
  internal static let lightbulb = ImageAsset(name: "lightbulb")

  // swiftlint:disable trailing_comma
  internal static let allColors: [ColorAsset] = [
  ]
  internal static let allImages: [ImageAsset] = [
    backupDoneIcon,
    backupIntroIllustration,
    backupToDoIcon,
    buttonStroke,
    closeXButton,
    closeXButtonDarkGray,
    confettiDiamond,
    confettiNormal,
    confettiStar,
    confettiTriangle,
    doneFireworks,
    doneSign,
    dualImageSeparator,
    emailAlert,
    emptyHistoryCoupon,
    errorSign,
    floorShadow,
    historyCouponIcon,
    historyCouponLine,
    historyKinIcon,
    historyShareButton,
    imageOnlyAnswerBackground,
    imageTextAnswerBackground,
    imageTextAnswerBackgroundSelected,
    kinCoin,
    kinLogoSplash,
    kinReward,
    kinTaskReward,
    kinTaskTime,
    kinTransactionCoins,
    moreSupportIcon,
    moreTabIcon,
    moreWalletBackupIcon,
    multipleAnswerBackground,
    multipleAnswerBackgroundSelected,
    multipleAnswerCheckmark,
    multipleAnswerPlus,
    nextTask,
    noInternetIllustration,
    noOffers,
    offerCardShadow,
    patternPlaceholder,
    paymentDelay,
    pickerArrow,
    progressViewGradient,
    progressViewTrack,
    quizConfettiOval,
    quizConfettiRectangle,
    quizConfettiTriangle,
    recordsLedger,
    redeemBubble,
    smallHeart,
    sowingIllustration,
    splashScreenBackground,
    tabBarBalance,
    tabBarEarn,
    tabBarMore,
    tabBarSpend,
    textAnswerShape,
    textAnswerShapeSelected,
    timer,
    transferFireworks,
    walletCreationFailed,
    welcomeTutorial1,
    welcomeTutorial2,
    welcomeTutorial3,
    whiteCheckmark,
    lightbulb,
  ]
  // swiftlint:enable trailing_comma
  @available(*, deprecated, renamed: "allImages")
  internal static let allValues: [AssetType] = allImages
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

internal extension Image {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
