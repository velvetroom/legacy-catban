workspace 'catban.xcworkspace'
use_frameworks!

def podlist
  pod 'CleanArchitecture'
end

target 'Shared' do
  platform :ios, '11.0'
  podlist
  project 'Shared/Shared.xcodeproj'
end

target 'TestsShared' do
    platform :ios, '11.0'
    podlist
    project 'Shared/Shared.xcodeproj'
end
