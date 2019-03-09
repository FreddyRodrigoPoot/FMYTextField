#
# Be sure to run `pod lib lint FMYTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FMYTextField'
  s.version          = '0.1.0'
  s.summary          = 'FMYTextField is a cocoapods that inherit the UITextField class, it allows manage a message error'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'FMYTextField is a cocoapods that inherit the UITextField class with methods that allow validate of text'
                       DESC

  s.homepage         = 'https://github.com/FreddyRodrigoPoot/FMYTextField.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Freddy R. Poot May' => 'rodrigo.pootmay@gmail.com' }
  s.source           = { :git => 'https://github.com/FreddyRodrigoPoot/FMYTextField.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FMYTextField/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FMYTextField' => ['FMYTextField/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
