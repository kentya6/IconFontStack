//
//  IconFontStepper.swift
//  IconFontStack
//
//  Created by Kengo Yokoyama on 2017/12/17.
//  Copyright © 2017年 AppKnop. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class IconFontStepper: UIStepper {
    
    @IBInspectable
    public var incrementIconId: String? {
        didSet {
            configure(incrementIconId, isIncrement: true)
        }
    }
    
    @IBInspectable
    public var decrementIconId: String? {
        didSet {
            configure(decrementIconId, isIncrement: false)
        }
    }
    
    private func configure(_ iconId: String?, isIncrement: Bool) {
        if let iconId = iconId, let fontType = FontType.createFontType(id: iconId) {
            if isIncrement {
                setIncrementIcon(icon: fontType, forState: .normal)
            } else {
                setDecrementIcon(icon: fontType, forState: .normal)
            }
        }
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure(incrementIconId, isIncrement: true)
        configure(decrementIconId, isIncrement: false)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        configure(incrementIconId, isIncrement: true)
        configure(decrementIconId, isIncrement: false)
    }
}

