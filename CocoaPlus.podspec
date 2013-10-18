Pod::Spec.new do |s|


  s.name         = "CocoaPlus"
  s.version      = "0.0.4"
  s.summary      = "A take-only-what-you-need collection of helpful classes and categories for iOS and OSX."

  s.description  = <<-DESC
                   A longer description of CocoaPlus in Markdown format.

                   These are some simple, misceleneous class and categories for iOS and OSX. They use subspecs, so you can pick and choose want you want instead of needing the whole thing.
                   DESC

  s.homepage     = "https://github.com/zakdances/CocoaPlus"


  s.license      = 'MIT'

  s.author       = 'Zak'

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.8'


  s.source       = { :git => "https://github.com/zakdances/CocoaPlus.git", :tag => "#{s.version}" }

  s.default_subspec = 'Core'

  s.ios.source_files  = 'iOS Classes', 'iOS Classes/**/*.{h,m}', 'iOS Categories', 'iOS Categories/**/*.{h,m}'
  s.osx.source_files  = 'OSX Classes', 'OSX Classes/**/*.{h,m}', 'OSX Categories', 'OSX Categories/**/*.{h,m}'

  s.subspec 'Core' do |cs|
    cs.exclude_files = '*RAC.{h,m}'
  end

  s.subspec 'CorePlusRac' do |cr|
    s.dependency 'ReactiveCocoa'
  end

  s.ios.frameworks   = ['CoreMedia', 'MediaPlayer', 'AVFoundation', 'QuartzCore', 'CoreGraphics']
  s.osx.frameworks   = ['Foundation', 'Cocoa', 'AppKit', 'WebKit']

  s.requires_arc = true


end
