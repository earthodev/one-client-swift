web_auth_files = [
  'EarthoOne/Array+Encode.swift',
  'EarthoOne/ASProvider.swift',
  'EarthoOne/AuthTransaction.swift',
  'EarthoOne/EarthoOneWebAuth.swift',
  'EarthoOne/BioAuthentication.swift',
  'EarthoOne/ChallengeGenerator.swift',
  'EarthoOne/ClaimValidators.swift',
  'EarthoOne/ClearSessionTransaction.swift',
  'EarthoOne/IDTokenSignatureValidator.swift',
  'EarthoOne/IDTokenValidator.swift',
  'EarthoOne/IDTokenValidatorContext.swift',
  'EarthoOne/JWK+RSA.swift',
  'EarthoOne/JWT+Header.swift',
  'EarthoOne/JWTAlgorithm.swift',
  'EarthoOne/LoginTransaction.swift',
  'EarthoOne/NSURLComponents+OAuth2.swift',
  'EarthoOne/OAuth2Grant.swift',
  'EarthoOne/SafariProvider.swift',
  'EarthoOne/TransactionStore.swift',
  'EarthoOne/WebAuth.swift',
  'EarthoOne/WebAuthentication.swift',
  'EarthoOne/WebAuthError.swift',
  'EarthoOne/WebAuthUserAgent.swift',
  'EarthoOne/UIWindow+TopViewController.swift',
  'EarthoOne/WebViewProvider.swift'
]

ios_files = ['EarthoOne/MobileWebAuth.swift']
macos_files = ['EarthoOne/DesktopWebAuth.swift']
excluded_files = [*web_auth_files, *ios_files, *macos_files]

Pod::Spec.new do |s|
  s.name             = 'EarthoOne'
  s.version          = '1.1.0'
  s.summary          = "EarthoOne SDK for Apple platforms"
  s.description      = <<-DESC
                        EarthoOne SDK for iOS, macOS, tvOS, watchOS and visionOS apps.
                        DESC
  s.homepage         = 'https://github.com/earthodev/one-client-swift'
  s.license          = 'Mozilla Public License Version 2.0'
  s.authors          = { 'Contact' => 'contact@eartho.io' }
  s.source           = { :git => 'https://github.com/earthodev/one-client-swift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/eartho'
  s.source_files     = 'EarthoOne/*.swift'
  s.resource_bundles = { s.name => 'EarthoOne/PrivacyInfo.xcprivacy' }
  s.swift_versions   = ['5.9']

  s.dependency 'SimpleKeychain', '1.2.0'
  s.dependency 'JWTDecode', '3.2.0'

  s.ios.deployment_target   = '14.0'
  s.ios.exclude_files       = macos_files
  s.ios.pod_target_xcconfig = { 'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => 'WEB_AUTH_PLATFORM' }

  s.osx.deployment_target   = '11.0'
  s.osx.exclude_files       = ios_files
  s.osx.pod_target_xcconfig = { 'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => 'WEB_AUTH_PLATFORM' }

#  s.tvos.deployment_target = '14.0'
#  s.tvos.exclude_files     = excluded_files

#  s.watchos.deployment_target = '7.0'
#  s.watchos.exclude_files     = excluded_files

#  s.visionos.deployment_target = '1.0'
#  s.visionos.exclude_files = macos_files
#  s.visionos.pod_target_xcconfig =  { 'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => 'WEB_AUTH_PLATFORM' }
end
