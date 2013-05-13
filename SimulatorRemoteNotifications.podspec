Pod::Spec.new do |s|
  s.name     = 'SimulatorRemoteNotifications'
  s.version  = '1.0'
  s.platform = :ios
  s.license  = 'MIT'
  s.summary  = 'SimulatorRemoteNotifications'
  s.homepage = 'https://github.com/kirualex/SimulatorRemoteNotifications'
  s.author   = { 'Arnzaud Coomans' => 'arnaud.coomans@gmail.com' }
  s.source   = { :git => 'https://github.com/kirualex/KASlideShow',
                 :tag => '1.0'}

  s.description = 'SimulatorRemoteNotifications is an iOS library to send (fake) remote notifications to the iOS simulator.'

  s.source_files = 'SimulatorRemoteNotifications/*.{h,m}'
  s.requires_arc =  true
  s.framework = 'Foundation'
end