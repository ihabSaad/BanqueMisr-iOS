platform :ios, '13.0'

workspace 'Banque Misr'

def globalDependencies
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'MOLH'
end

# Main App
target 'Banque Misr' do
  use_frameworks!
  globalDependencies

  target 'Banque MisrTests' do
    inherit! :search_paths
  end

  target 'Banque MisrUITests' do
    inherit! :search_paths
  end
end

# CoreBankingAPI Framework
target 'CoreBankingAPI' do
  project 'subProject/CoreBankingAPI/CoreBankingAPI.xcodeproj'
  use_frameworks!
   globalDependencies
  # globalDependencies
end

# DesignSystem Framework
target 'DesignSystem' do
  project 'subProject/DesignSystem/DesignSystem.xcodeproj'
  use_frameworks!
  # globalDependencies 
end