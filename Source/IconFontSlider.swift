//
//  IconFontSlider.swift
//  IconFontStack
//
//  Created by Kengo Yokoyama on 2017/12/17.
//  Copyright © 2017年 AppKnop. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class IconFontSlider: UISlider {
    
    @IBInspectable
    public var minimumValueIconId: String? {
        didSet {
            configure(minimumValueIconId, isMinimum: true)
        }
    }
    
    @IBInspectable
    public var maximumValueIconId: String? {
        didSet {
            configure(maximumValueIconId, isMinimum: false)
        }
    }
    
    private func configure(_ iconId: String?, isMinimum: Bool) {
        if let iconId = iconId, let fontType = FontType.createFontType(id: iconId) {
            if isMinimum {
                setMinimumValueIcon(icon: fontType, color: minimumTrackTintColor ?? .black, size: nil)
            } else {
                setMaximumValueIcon(icon: fontType, color: maximumTrackTintColor ?? .black, size: nil)
            }
        }
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure(minimumValueIconId, isMinimum: true)
        configure(maximumValueIconId, isMinimum: false)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        configure(minimumValueIconId, isMinimum: true)
        configure(maximumValueIconId, isMinimum: false)
    }
}

