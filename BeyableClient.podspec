
Pod::Spec.new do |spec|

spec.name = "BeyableClient"

spec.version = "0.0.1"

spec.summary = "Beyable Client iOS"

spec.description = "Beyable Client for iOS"

spec.homepage = "https://github.com/BEYABLE/BEYABLE-sdk-mobile-ios-natif"

spec.license = { :type => "MIT", :file => "LICENSE" }

spec.author = { "Brahim Ouamassi" => "ouamassi.brahim@gmail.com" }

spec.platform = :ios, "15.0"

spec.swift_version = '5.0'

spec.source = { :git => "https://github.com/BEYABLE/BEYABLE-sdk-mobile-ios-natif.git", :tag => '0.0.1' }

spec.source_files = "Sources/BeyableClient/**/*.{swift}"

end
