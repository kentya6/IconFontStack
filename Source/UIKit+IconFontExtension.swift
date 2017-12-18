//
//  UIKit+IconFontExtension.swift
//  IconFontStack
//
//  Created by Kengo Yokoyama on 2017/12/17.
//  Copyright © 2017年 AppKnop. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
}

public extension UIImage {
    
    /**
     Set IconFont to UIImage
     
     - Parameter icon: The icon for the UIImage
     - Parameter color: icon color
     - Parameter size: icon size
     */
    public convenience init(icon: FontType, color: UIColor = .black, size: CGSize) {
        FontLoader.loadFontIfNeeded(fontType: icon)
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        let fontAspectRatio: CGFloat = 1.28571429
        let fontSize = min(size.width / fontAspectRatio, size.height)
        let font = UIFont(name: icon.fontName(), size: fontSize)
        assert(font != nil, icon.errorAnnounce())
        let attributes: [NSAttributedStringKey: Any] = [.font: font!, .foregroundColor: color, .paragraphStyle: paragraph]
        let attributedString = NSAttributedString(string: icon.text!, attributes: attributes)
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) * 0.5, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image {
            self.init(cgImage: image.cgImage!, scale: image.scale, orientation: image.imageOrientation)
        } else {
            self.init()
        }
    }
}

public extension UIImageView {
    
    /**
     Set IconFont to UIImageView
     
     - Parameter icon: The icon for the UIImageView
     - Parameter color: icon color
     - Parameter size: icon size
     */
    public func setIcon(icon: FontType, color: UIColor = .black, size: CGSize? = nil) {
        self.image = UIImage(icon: icon, color: color, size: size ?? frame.size)
    }
}

public extension UILabel {
    
    /**
     Set IconFont to UILabel
     
     - Parameter icon: The icon for the UILabel
     - Parameter color: icon color
     - Parameter size: icon size
     */
    public func setIcon(icon: FontType, color: UIColor = .black, size: CGFloat) {
        FontLoader.loadFontIfNeeded(fontType: icon)
        
        let iconFont = UIFont(name: icon.fontName(), size: size)
        assert(iconFont != nil, icon.errorAnnounce())
        text = icon.text
        font = iconFont
        textColor = color
        textAlignment = .center
    }
}

public extension UIButton {
    
    /**
     Set IconFont to UIButton
     
     - Parameter icon: The icon for the UIButton
     - Parameter color: icon color
     - Parameter size: icon size
     - Parameter forState: Control state of the UIButton
     */
    public func setIcon(icon: FontType, color: UIColor = .black, size: CGFloat? = nil, forState state: UIControlState) {
        let size = size ?? titleLabel?.font.pointSize
        
        FontLoader.loadFontIfNeeded(fontType: icon)
        guard let titleLabel = titleLabel else { return }
        setAttributedTitle(nil, for: state)
        let font = UIFont(name: icon.fontName(), size: size!)
        assert(font != nil, icon.errorAnnounce())
        titleLabel.font = font!
        setTitleColor(color, for: state)
        setTitle(icon.text, for: state)
        titleLabel.textAlignment = .center
        self.backgroundColor = backgroundColor
    }
}

public extension UISegmentedControl {
    
    /**
     Set IconFont to UISegmentedControl
     
     - Parameter icon: The icon
     - Parameter color: icon color
     - Parameter size: icon size
     - Parameter forSegmentAtIndex: Segment index for the icon
     */
    public func setIcon(icon: FontType, color: UIColor = .black, size: CGFloat? = nil, forSegmentAtIndex segment: Int) {
        FontLoader.loadFontIfNeeded(fontType: icon)
        let font = UIFont(name: icon.fontName(), size: size ?? 20)
        assert(font != nil, icon.errorAnnounce())
        setTitleTextAttributes([NSAttributedStringKey.font: font!], for: .normal)
        setTitle(icon.text, forSegmentAt: segment)
        tintColor = color
    }
}

public extension UITabBarItem {
    
    /**
     Set IconFont to UITabBarItem
     
     - Parameter icon: The icon for the UITabBarItem
     - Parameter color: icon color when not selected Color for the icon when UITabBarItem is not selected
     - Parameter selectedTextColor: Color for the icon when UITabBarItem is selected
     - Parameter selectedBackgroundColor: Background color for the icon when UITabBarItem is selected
     - Parameter size: icon size
     */
    public func setIcon(icon: FontType, color: UIColor = .black, selectedColor: UIColor = .black, selectedBackgroundColor: UIColor = .clear, size: CGSize? = nil) {
        
        let tabBarItemImageSize = size ?? CGSize(width: 30, height: 30)
        image = UIImage(icon: icon, color: color, size: tabBarItemImageSize).withRenderingMode(.alwaysOriginal)
        selectedImage = UIImage(icon: icon, color: selectedColor, size: tabBarItemImageSize).withRenderingMode(.alwaysOriginal)
    }
}

public extension UISlider {
    
    /**
     Set IconFont to the maximum value of UISlider
     
     - Parameter icon: The icon for the maximum value of UISlider
     - Parameter color: icon color
     - Parameter size: icon size
     */
    public func setMaximumValueIcon(icon: FontType, color: UIColor = .black, size: CGSize? = nil) {
        maximumValueImage = UIImage(icon: icon, color: color, size: size ?? CGSize(width: 25,height: 25))
    }
    
    
    /**
     Set IconFont to the minimum value of UISlider
     
     - Parameter icon: The icon for the minimum value of UISlider
     - Parameter color: Color for the icon
     - Parameter size: CGSize for the icon
     */
    public func setMinimumValueIcon(icon: FontType, color: UIColor = .black, size: CGSize? = nil) {
        minimumValueImage = UIImage(icon: icon, color: color, size: size ?? CGSize(width: 25,height: 25))
    }
}

public extension UIBarButtonItem {
    
    /**
     This function sets the icon for UIBarButtonItem
     
     - Parameter icon: The icon for the for UIBarButtonItem
     - Parameter color: icon color
     - Parameter size: icon size
     */
    public func setIcon(icon: FontType, color: UIColor = .black, size: CGFloat) {
        FontLoader.loadFontIfNeeded(fontType: icon)
        let font = UIFont(name: icon.fontName(), size: size)
        assert(font != nil, icon.errorAnnounce())
        setTitleTextAttributes([.font: font!], for: .normal)
        title = icon.text
        tintColor = color
    }
}

public extension UIStepper {
    
    /**
     Set IconFont to UIStepper
     
     - Parameter icon: The icon for the for UIStepper
     - Parameter forState: Control state of the increment icon of the UIStepper
     */
    public func setIncrementIcon(icon: FontType?, forState state: UIControlState) {
        let size = CGSize(width: 20, height: 20)
        let image = UIImage(icon: icon!, size: size)
        setIncrementImage(image, for: state)
    }
    
    
    /**
     Set IconFont to UIStepper
     
     - Parameter icon: The icon for the for UIStepper
     - Parameter forState: Control state of the decrement icon of the UIStepper
     */
    public func setDecrementIcon(icon: FontType?, forState state: UIControlState) {
        let size = CGSize(width: 20, height: 20)
        let image = UIImage(icon: icon!, size: size)
        setDecrementImage(image, for: state)
    }
}

public extension UITextField {
    
    /**
     Set IconFont to the right view of UITextField
     
     - Parameter icon: The icon for the right view of the UITextField
     - Parameter rightViewMode: UITextFieldViewMode for the right view of the UITextField
     - Parameter size: CGSize for the icon
     - Parameter color: Color for the icon
     */
    public func setRightViewIcon(icon: FontType, rightViewMode: UITextFieldViewMode = .always, color: UIColor = .black, size: CGSize? = nil) {
        FontLoader.loadFontIfNeeded(fontType: icon)
        
        let image = UIImage(icon: icon, color: color, size: size ?? CGSize(width: 30, height: 30))
        let imageView = UIImageView.init(image: image)
        
        self.rightView = imageView
        self.rightViewMode = rightViewMode
    }
    
    
    /**
     Set IconFont to the left view of UITextField
     
     - Parameter icon: The icon for the left view of the UITextField
     - Parameter leftViewMode: UITextFieldViewMode for the left view of the UITextField
     - Parameter color: Color for the icon
     - Parameter size: CGSize for the icon
     */
    public func setLeftViewIcon(icon: FontType, leftViewMode: UITextFieldViewMode = .always, color: UIColor = .black, size: CGSize? = nil) {
        FontLoader.loadFontIfNeeded(fontType: icon)
        
        let image = UIImage(icon: icon, color: color, size: size ?? CGSize(width: 30, height: 30))
        let imageView = UIImageView.init(image: image)
        
        self.leftView = imageView
        self.leftViewMode = leftViewMode
    }
}

public extension UIViewController {
    
    /**
     Set IconFont to UIViewController
     
     - Parameter icon: The icon for the title of navigation bar
     - Parameter color: icon color
     - Parameter size: icon size
     */
    public func setTitleIcon(icon: FontType, color: UIColor = .black, size: CGFloat? = nil) {
        let size = size ?? 23
        FontLoader.loadFontIfNeeded(fontType: icon)
        let font = UIFont(name: icon.fontName(), size: size)
        assert(font != nil, icon.errorAnnounce())
        let titleAttributes: [NSAttributedStringKey: Any] = [.font: font!, .foregroundColor: color]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        title = icon.text
    }
}
