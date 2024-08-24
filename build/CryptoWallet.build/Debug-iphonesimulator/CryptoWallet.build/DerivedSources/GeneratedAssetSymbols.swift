import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

    /// The "AccentColor" asset catalog color resource.
    static let accent = ColorResource(name: "AccentColor", bundle: resourceBundle)

    /// The "BackgroundColor" asset catalog color resource.
    static let background = ColorResource(name: "BackgroundColor", bundle: resourceBundle)

    /// The "IndicatorDownColor" asset catalog color resource.
    static let indicatorDown = ColorResource(name: "IndicatorDownColor", bundle: resourceBundle)

    /// The "IndicatorUpColor" asset catalog color resource.
    static let indicatorUp = ColorResource(name: "IndicatorUpColor", bundle: resourceBundle)

    /// The "PortfolioRowColor" asset catalog color resource.
    static let portfolioRow = ColorResource(name: "PortfolioRowColor", bundle: resourceBundle)

    /// The "SecondaryTextColor" asset catalog color resource.
    static let secondaryText = ColorResource(name: "SecondaryTextColor", bundle: resourceBundle)

    /// The "headerBackground" asset catalog color resource.
    static let headerBackground = ColorResource(name: "headerBackground", bundle: resourceBundle)

    /// The "tabbarBackgroundColor" asset catalog color resource.
    static let tabbarBackground = ColorResource(name: "tabbarBackgroundColor", bundle: resourceBundle)

    /// The "tabbarUnselectedColor" asset catalog color resource.
    static let tabbarUnselected = ColorResource(name: "tabbarUnselectedColor", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "downIndicator" asset catalog image resource.
    static let downIndicator = ImageResource(name: "downIndicator", bundle: resourceBundle)

    /// The "headerLogo" asset catalog image resource.
    static let headerLogo = ImageResource(name: "headerLogo", bundle: resourceBundle)

    /// The "iconPlaceholder" asset catalog image resource.
    static let iconPlaceholder = ImageResource(name: "iconPlaceholder", bundle: resourceBundle)

    /// The "upIndicator" asset catalog image resource.
    static let upIndicator = ImageResource(name: "upIndicator", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "AccentColor" asset catalog color.
    static var accent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .accent)
#else
        .init()
#endif
    }

    /// The "BackgroundColor" asset catalog color.
    static var background: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .background)
#else
        .init()
#endif
    }

    /// The "IndicatorDownColor" asset catalog color.
    static var indicatorDown: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .indicatorDown)
#else
        .init()
#endif
    }

    /// The "IndicatorUpColor" asset catalog color.
    static var indicatorUp: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .indicatorUp)
#else
        .init()
#endif
    }

    /// The "PortfolioRowColor" asset catalog color.
    static var portfolioRow: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .portfolioRow)
#else
        .init()
#endif
    }

    /// The "SecondaryTextColor" asset catalog color.
    static var secondaryText: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .secondaryText)
#else
        .init()
#endif
    }

    /// The "headerBackground" asset catalog color.
    static var headerBackground: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .headerBackground)
#else
        .init()
#endif
    }

    /// The "tabbarBackgroundColor" asset catalog color.
    static var tabbarBackground: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .tabbarBackground)
#else
        .init()
#endif
    }

    /// The "tabbarUnselectedColor" asset catalog color.
    static var tabbarUnselected: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .tabbarUnselected)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "AccentColor" asset catalog color.
    static var accent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .accent)
#else
        .init()
#endif
    }

    /// The "BackgroundColor" asset catalog color.
    static var background: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .background)
#else
        .init()
#endif
    }

    /// The "IndicatorDownColor" asset catalog color.
    static var indicatorDown: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .indicatorDown)
#else
        .init()
#endif
    }

    /// The "IndicatorUpColor" asset catalog color.
    static var indicatorUp: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .indicatorUp)
#else
        .init()
#endif
    }

    /// The "PortfolioRowColor" asset catalog color.
    static var portfolioRow: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .portfolioRow)
#else
        .init()
#endif
    }

    /// The "SecondaryTextColor" asset catalog color.
    static var secondaryText: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .secondaryText)
#else
        .init()
#endif
    }

    /// The "headerBackground" asset catalog color.
    static var headerBackground: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .headerBackground)
#else
        .init()
#endif
    }

    /// The "tabbarBackgroundColor" asset catalog color.
    static var tabbarBackground: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .tabbarBackground)
#else
        .init()
#endif
    }

    /// The "tabbarUnselectedColor" asset catalog color.
    static var tabbarUnselected: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .tabbarUnselected)
#else
        .init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// The "AccentColor" asset catalog color.
    static var accent: SwiftUI.Color { .init(.accent) }

    /// The "BackgroundColor" asset catalog color.
    static var background: SwiftUI.Color { .init(.background) }

    /// The "IndicatorDownColor" asset catalog color.
    static var indicatorDown: SwiftUI.Color { .init(.indicatorDown) }

    /// The "IndicatorUpColor" asset catalog color.
    static var indicatorUp: SwiftUI.Color { .init(.indicatorUp) }

    /// The "PortfolioRowColor" asset catalog color.
    static var portfolioRow: SwiftUI.Color { .init(.portfolioRow) }

    /// The "SecondaryTextColor" asset catalog color.
    static var secondaryText: SwiftUI.Color { .init(.secondaryText) }

    /// The "headerBackground" asset catalog color.
    static var headerBackground: SwiftUI.Color { .init(.headerBackground) }

    /// The "tabbarBackgroundColor" asset catalog color.
    static var tabbarBackground: SwiftUI.Color { .init(.tabbarBackground) }

    /// The "tabbarUnselectedColor" asset catalog color.
    static var tabbarUnselected: SwiftUI.Color { .init(.tabbarUnselected) }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "AccentColor" asset catalog color.
    static var accent: SwiftUI.Color { .init(.accent) }

    /// The "BackgroundColor" asset catalog color.
    static var background: SwiftUI.Color { .init(.background) }

    /// The "IndicatorDownColor" asset catalog color.
    static var indicatorDown: SwiftUI.Color { .init(.indicatorDown) }

    /// The "IndicatorUpColor" asset catalog color.
    static var indicatorUp: SwiftUI.Color { .init(.indicatorUp) }

    /// The "PortfolioRowColor" asset catalog color.
    static var portfolioRow: SwiftUI.Color { .init(.portfolioRow) }

    /// The "SecondaryTextColor" asset catalog color.
    static var secondaryText: SwiftUI.Color { .init(.secondaryText) }

    /// The "headerBackground" asset catalog color.
    static var headerBackground: SwiftUI.Color { .init(.headerBackground) }

    /// The "tabbarBackgroundColor" asset catalog color.
    static var tabbarBackground: SwiftUI.Color { .init(.tabbarBackground) }

    /// The "tabbarUnselectedColor" asset catalog color.
    static var tabbarUnselected: SwiftUI.Color { .init(.tabbarUnselected) }

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "downIndicator" asset catalog image.
    static var downIndicator: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .downIndicator)
#else
        .init()
#endif
    }

    /// The "headerLogo" asset catalog image.
    static var headerLogo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .headerLogo)
#else
        .init()
#endif
    }

    /// The "iconPlaceholder" asset catalog image.
    static var iconPlaceholder: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .iconPlaceholder)
#else
        .init()
#endif
    }

    /// The "upIndicator" asset catalog image.
    static var upIndicator: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .upIndicator)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "downIndicator" asset catalog image.
    static var downIndicator: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .downIndicator)
#else
        .init()
#endif
    }

    /// The "headerLogo" asset catalog image.
    static var headerLogo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .headerLogo)
#else
        .init()
#endif
    }

    /// The "iconPlaceholder" asset catalog image.
    static var iconPlaceholder: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .iconPlaceholder)
#else
        .init()
#endif
    }

    /// The "upIndicator" asset catalog image.
    static var upIndicator: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .upIndicator)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
@available(watchOS, unavailable)
extension ColorResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
@available(watchOS, unavailable)
extension ImageResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Hashable {

    /// An asset catalog color resource name.
    fileprivate let name: String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Hashable {

    /// An asset catalog image resource name.
    fileprivate let name: String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif