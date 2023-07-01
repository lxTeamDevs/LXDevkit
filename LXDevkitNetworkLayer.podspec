Pod::Spec.new do |spec|

  spec.swift_version = "4.2"
  

  spec.name         = "LXDevkitNetworkLayer"
  spec.version      = "0.0.4"
  spec.summary      = "A short description of LXDevkitNetworkLayer."
  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/lxTeamDevs/LXDevkit"

  spec.author             = { "Artak Gevorgyan" => "artakreg@gmail.com" }
   spec.ios.deployment_target = "12.1"

  spec.source       = { :git => "https://github.com/lxTeamDevs/LXDevkit.git", :tag => "#{spec.version}" }
  

  spec.source_files  = "LXDevkitNetworkLayer/LXDevkitNetworkLayer/**/*.{h,m,swift}"

end
