//
//  ViewController.swift
//  iOS Example
//
//  Created by Kengo Yokoyama on 2017/12/18.
//  Copyright © 2017年 AppKnop. All rights reserved.
//

import UIKit
import IconFontStack

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel! {
        didSet {
            label.setIcon(icon: .googleMaterialDesign(.settings), size: 30)
        }
    }
    
    @IBOutlet private weak var image: UIImageView! {
        didSet {
            image.setIcon(icon: .fontAwesome(.star), color: .orange, size: CGSize(width: 44, height: 44))
        }
    }
    
    @IBOutlet private weak var button: UIButton! {
        didSet {
            button.setIcon(icon: .fontAwesome(.heart), forState: .normal)
        }
    }
    
    @IBOutlet private weak var textField: UITextField! {
        didSet {
            textField.setRightViewIcon(icon: .fontAwesome(.addressBook))
            textField.setLeftViewIcon(icon: .fontAwesome(.adn))
        }
    }
    
    @IBOutlet private weak var stepper: UIStepper! {
        didSet {
            stepper.setIncrementIcon(icon: .ionicons(.alert), forState: .normal)
            stepper.setDecrementIcon(icon: .ionicons(.leaf), forState: .normal)
        }
    }
    
    @IBOutlet private weak var slider: UISlider! {
        didSet {
            slider.setMaximumValueIcon(icon: .fontAwesome(.key))
            slider.setMinimumValueIcon(icon: .fontAwesome(.home))
        }
    }
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl! {
        didSet {
            segmentedControl.setIcon(icon: .googleMaterialDesign(.shop), forSegmentAtIndex: 0)
            segmentedControl.setIcon(icon: .googleMaterialDesign(.openInNew), forSegmentAtIndex: 1)
        }
    }
}
