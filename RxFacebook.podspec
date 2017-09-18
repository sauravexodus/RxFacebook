#
# Be sure to run `pod lib lint RxFacebook.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxFacebook'
  s.version          = '0.1.0'
  s.summary          = 'Reactive extensions for Facebook Login and Graph Request Libraries.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Reactive extensions for Facebook Login and Graph Request Libraries. 
It helps alot when you are chaining multiple graph requests after a login request.
                       DESC

  s.homepage         = 'https://github.com/sauravexodus/RxFacebook'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sauravexodus' => 'saurav.chandra1992@live.com' }
  s.source           = { :git => 'https://github.com/sauravexodus/RxFacebook.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RxFacebook/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RxFacebook' => ['RxFacebook/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'RxSwift', '>=3.0'
  s.dependency 'FacebookLogin', '>=0.2.0'
  s.dependency 'FacebookCore', '>=0.2.0'
end
