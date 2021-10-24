Pod::Spec.new do |spec|
  spec.name          = 'CoreFoundationKit'
  spec.version       = '0.1.0'
  spec.license       = { :type => 'MIT' }
  spec.homepage      = 'https://github.com/0vertex/CoreFoundationKit'
  spec.authors       = 'Manish'
  spec.summary       = 'Provides helpful extensions and rich features build on top of Foundation framework.'
  spec.source        = { :git => 'https://github.com/0vertex/CoreFoundationKit.git', :tag => spec.version }
  spec.module_name   = 'CoreFoundationKit'
  spec.swift_version = '5.0'

  spec.ios.deployment_target  = '11.0'

  spec.source_files   = 'Sources/**/*.swift'
end