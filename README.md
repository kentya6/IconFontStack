IconFontStack
==================

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/IconFontStack.svg)](https://img.shields.io/cocoapods/v/IconFontStack.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](http://mit-license.org)
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
[![Percentage of issues still open](http://isitmaintained.com/badge/open/kentya6/IconFontStack.svg)](http://isitmaintained.com/project/kentya6/IconFontStack "Percentage of issues still open")
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/kentya6/IconFontStack.svg)](http://isitmaintained.com/project/kentya6/IconFontStack "Average time to resolve an issue")

## Features
- [x] Various IconFonts (FontAwesome, ionicons, googleMaterialDesignIcons)
- [x] Enum-base mapping
- [x] Support IBDesignable

## Usage
#### UILabel
```swift
label.setIcon(icon: .googleMaterialDesign(.settings), size: 30)
```

#### UIButton
```swift
button.setIcon(icon: .fontAwesome(.heart), forState: .normal)
```

#### UITextField
```swift
textField.setRightViewIcon(icon: .fontAwesome(.addressBook))
textField.setLeftViewIcon(icon: .fontAwesome(.star))
```

#### UIStepper
```swift
stepper.setIncrementIcon(icon: .ionicons(.alert), forState: .normal)
stepper.setDecrementIcon(icon: .ionicons(.leaf), forState: .normal)
```

#### UISlider
```swift
slider.setMinimumValueIcon(icon: .fontAwesome(.home))
slider.setMaximumValueIcon(icon: .fontAwesome(.key))
```

#### UIImageView
```swift
imageView.setIcon(icon: .fontAwesome(.star), color: .orange, size: CGSize(width: 44, height: 44))
```

#### UISegmentedControl
```swift
segmentedControl.setIcon(icon: .googleMaterialDesign(.shop), forSegmentAtIndex: 0)
segmentedControl.setIcon(icon: .googleMaterialDesign(.openInNew), forSegmentAtIndex: 1)
```

## Support @IBDesignable
1. Add UI Element into Storyboard.
2. Rename it to `IconFontXXX`. (supported classes are listed below)
3. Open inspecter and fill iconfont id (ex: fa-check, ion-ios-email) to `icon Id` placeholder.

```
- IconFontLabel (UILabel)
- IconFontStepper (UIStepper)
- IconFontSlider (UISlider)
- IconFontImageView (UIImageView)
- IconFontTextField (UITextField)
- IconFontSegmentedControl (UISegmentedControl)
- IconFontButton (UIButton)
```

<p align="center" >
<img src="https://raw.githubusercontent.com/kentya6/IconFontStack/gh-pages/demo.gif" width="539" height="200"/>
</p>


## Requirement
- Swift4

## Installation
#### CocoaPods
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects.

To integrate IconFontStack into your Xcode project using CocoaPods, specify it in your `podfile`:

```
target 'YourProject' do
    use_frameworks!
    pod 'IconFontStack', '~> 0.1'
end
```

Then, run the following command:

```
$ pod install
```

#### Carthage (iOS 8+)
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate IconFontStack into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "kentya6/IconFontStack" >= 0.1
```

#### Manually
1. Add `Source` folder into your Xcode project. [Folder Link](https://github.com/kentya6/IconFontStack/tree/master/Source)
2. Add .swift file included `Source` folder to `Compile Sources`.

## Licence
The MIT License (MIT)

Copyright (c) 2017 Kengo YOKOYAMA

## Author
[kentya6](https://github.com/kentya6)

## Contributing
1. Fork it (http://github.com/kentya6/IconFontStack/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
