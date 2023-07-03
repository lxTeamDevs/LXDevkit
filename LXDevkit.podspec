Pod::Spec.new do |spec|

  spec.swift_version = "4.2"
  spec.name         = "LXDevkit"
  spec.version      = "0.0.5"
  spec.summary      = "A short description of LXDevkit."
  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/lxTeamDevs/LXDevkit"
  spec.author       = { "Artak Gevorgyan" => "artakreg@gmail.com" }
  spec.ios.deployment_target = "12.1"
  spec.source       = { :git => "https://github.com/lxTeamDevs/LXDevkit.git", :tag => "#{spec.version}" }
  spec.source_files  = "LXDevkitExtensions/**/*.{h,m,swift}"

  #spec.subspec "LXDevkitNetworkLayer" do |ss|
  #  ss.ios.deployment_target = '12.1'
  #  ss.source_files = "LXDevkitNetworkLayer/LXDevkitNetworkLayer/**/*.{h,m,swift}"
  #  ss.dependency "Alamofire"
  #  ss.dependency "SwiftyJSON"

  #end

end
