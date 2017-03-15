Pod::Spec.new do |s|
s.name         = "THDPopup"
s.version      = "0.0.2"
s.summary      = "A simple custom popup view controller."
s.homepage = "https://github.com/00aney/THDPopup"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Taedong Kim" => "[yenafirst91@gmail.com]" }
s.platform     = :ios
s.ios.deployment_target = "8.0"
s.source = { :git => "https://github.com/00aney/THDPopup.git", :tag => "#{s.version}"}
s.source_files = "THDPopup/**/*.{swift}"
s.framework = "UIKit"
s.requires_arc = true
s.dependency 'Alamofire', '~> 4.3'
s.dependency 'Kingfisher', '~> 3.3'
s.dependency 'SnapKit', '~> 3.2'
s.dependency 'ManualLayout', '~> 1.3'
end
