platform :ios, '11.0'

def unit_test_libs
    pod 'Quick'
    pod 'QuickSwiftCheck'
    pod 'Nimble'
end

def analytics
  pod 'Crashlytics'
  pod 'Fabric'
  pod 'Firebase'
end

def networking
  pod 'Moya'
  pod 'PromiseKit'
  pod 'Socket.IO-Client-Swift', '~> 14.0.0'
end

def common_pods
  pod 'SnapKit'
  pod 'CryptoSwift'
  pod 'OpenSSL-Universal'

  pod 'Reveal-SDK', :configurations => ['Debug']

  networking
end

target 'Wallet' do
  use_frameworks!
  common_pods
  analytics
  target 'WalletTests' do
    inherit! :search_paths
    unit_test_libs
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
    end
  end
end