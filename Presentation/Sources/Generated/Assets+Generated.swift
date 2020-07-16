// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let icArrowForward = ImageAsset(name: "icArrowForward")
  internal static let icBack = ImageAsset(name: "icBack")
  internal static let icEmail = ImageAsset(name: "icEmail")
  internal static let icFilter = ImageAsset(name: "icFilter")
  internal static let icGoldStarRegular = ImageAsset(name: "icGoldStarRegular")
  internal static let icGoldStarSmall = ImageAsset(name: "icGoldStarSmall")
  internal static let icGrayStarRegular = ImageAsset(name: "icGrayStarRegular")
  internal static let icGrayStarSmall = ImageAsset(name: "icGrayStarSmall")
  internal static let icHomeActive = ImageAsset(name: "icHomeActive")
  internal static let icHomeInactive = ImageAsset(name: "icHomeInactive")
  internal static let icMapActive = ImageAsset(name: "icMapActive")
  internal static let icMapInactive = ImageAsset(name: "icMapInactive")
  internal static let icPhone = ImageAsset(name: "icPhone")
  internal static let icPin = ImageAsset(name: "icPin")
  internal static let icProfileActive = ImageAsset(name: "icProfileActive")
  internal static let icProfileInactive = ImageAsset(name: "icProfileInactive")
  internal static let icShare = ImageAsset(name: "icShare")
  internal static let icTime = ImageAsset(name: "icTime")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
