#
# Be sure to run `pod lib lint wobbly.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'wobbly'
  s.version          = '0.1.1'
  s.summary          = 'Easy to use animations for iOS'
  s.swift_version = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = ' (Animate CSS) animations for iOS. An easy to use library of iOS animations. As easy to use as an easy thing.'

  s.homepage         = 'https://github.com/sagaya/Wobbly'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sagaya' => 'shaggy.hafeez@gmail.com' }
  s.source           = { :git => 'https://github.com/sagaya/Wobbly.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/sagaya_hafeez'

  s.ios.deployment_target = '11.0'

  s.source_files = 'wobbly/Classes/**/*'
  
  # s.resource_bundles = {
  #   'wobbly' => ['wobbly/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
