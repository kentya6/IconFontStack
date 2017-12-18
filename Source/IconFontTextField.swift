//
//  IconFontTextField.swift
//  IconFontStack
//
//  Created by Kengo Yokoyama on 2017/12/17.
//  Copyright © 2017年 AppKnop. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class IconFontTextFielid: UITextField {
    
    @IBInspectable
    public var rightIconId: String? {
        didSet {
            configure(rightIconId, isRight: true)
        }
    }
    
    @IBInspectable
    public var leftIconId: String? {
        didSet {
            configure(leftIconId, isRight: false)
        }
    }
    
    @IBInspectable
    public var iconColor: UIColor = .black {
        didSet {
            configure(rightIconId, isRight: true)
            configure(leftIconId, isRight: true)
        }
    }
    
    private func configure(_ iconId: String?, isRight: Bool) {
        if let iconId = iconId, let fontType = FontType.createFontType(id: iconId) {
            if isRight {
                setRightViewIcon(icon: fontType, rightViewMode: .always, color: iconColor, size: nil)
            } else {
                setLeftViewIcon(icon: fontType, leftViewMode: .always, color: iconColor, size: nil)
            }
        }
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure(rightIconId, isRight: true)
        configure(leftIconId, isRight: false)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        configure(rightIconId, isRight: true)
        configure(leftIconId, isRight: false)
    }
}
