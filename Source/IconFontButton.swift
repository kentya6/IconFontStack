//
//  IconFontButton.swift
//  IconFontStack
//
//  Created by Kengo Yokoyama on 2017/12/17.
//  Copyright © 2017年 AppKnop. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class IconFontButton: UIButton {
    
    @IBInspectable
    public var iconId: String? {
        didSet {
            configure(iconId)
        }
    }
    
    private func configure(_ iconId: String?) {
        if let iconId = iconId, let fontType = FontType.createFontType(id: iconId) {
            setIcon(icon: fontType, color: titleLabel!.textColor, size: titleLabel!.font.pointSize, forState: .normal)
            titleLabel!.setIcon(icon: fontType, color: titleLabel!.textColor, size: titleLabel!.font.pointSize)            
        }
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure(iconId)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        configure(iconId)
    }
}

