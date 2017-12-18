//
//  IconFontSegmentedControl.swift
//  IconFontStack
//
//  Created by Kengo Yokoyama on 2017/12/17.
//  Copyright © 2017年 AppKnop. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class IconFontSegmentedControl: UISegmentedControl {
    
    @IBInspectable
    public var iconId: String? {
        didSet {
            configure(iconId)
        }
    }
    
    private func configure(_ iconId: String?) {
        guard let iconId = iconId else { return }
        let separeted = iconId.split(separator: ",")
        if separeted.count != numberOfSegments {
            return
        }
        
        // Please set same iconfont type to all index.
        separeted.enumerated().forEach { index, iconId in
            if let fontType = FontType.createFontType(id: iconId.trimmingCharacters(in: .whitespaces).lowercased()) {
                setIcon(icon: fontType, color: tintColor, size: nil, forSegmentAtIndex: index)
            }
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
