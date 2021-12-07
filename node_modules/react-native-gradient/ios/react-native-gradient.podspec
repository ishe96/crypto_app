require 'json'
package = JSON.parse(File.read('../package.json'))

Pod::Spec.new do |s|
  s.name                    = package['name']
  s.version                 = package['version']
  s.homepage                = package['homepage']
  s.summary                 = package['description']
  s.license                 = package['license']
  s.author                  = { 'Q42' => 'https://q42.nl' }
  s.ios.deployment_target   = '10.0'
  s.source                  = { :git => 'https://github.com/Q42/react-native-gradient.git', :tag => "#{s.version}" }
  s.source_files            = 'RNQ42Gradient/*.{h,m,swift}'
  s.preserve_paths          = '**/*.js'

  s.dependency 'React'
end
