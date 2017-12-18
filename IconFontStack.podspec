Pod::Spec.new do |s|
  s.name         = "IconFontStack"
  s.version      = "0.1"
  s.summary      = "Icon Font library for iOS"
  s.homepage     = "https://github.com/kentya6/IconFontStack"
  s.license      = "MIT"
  s.author       = { "Kengo Yokoyama" => "appknop@gmail.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/kentya6/IconFontStack.git", :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.source_files  = "Source/*.swift"
  s.resource_bundle = { 'IconFontStack' => 'Source/IconFonts/*.ttf' }
  s.requires_arc = true
  s.ios.framework  = 'UIKit'
end
