Pod::Spec.new do |s|
  s.name         = "QuaNode-Socket.IO-Client-Swift"
  s.module_name  = "SocketIO"
  s.version      = "15.2.1"
  s.summary      = "Socket.IO-client for iOS and OS X"
  s.description  = <<-DESC
                   Socket.IO-client for iOS and OS X.
                   Supports ws/wss/polling connections and binary.
                   For socket.io 2.0+ and Swift.
                   DESC
  s.homepage     = "https://github.com/socketio/socket.io-client-swift"
  s.license      = { :type => 'MIT' }
  s.author       = { "Erik" => "nuclear.ace@gmail.com" }
  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.13'
  s.tvos.deployment_target = '12.0'
  s.watchos.deployment_target = '4.0'
  s.requires_arc = true
  s.source = {
    :git => "https://github.com/QuaNode/socket.io-client-swift.git",
    :tag => 'v15.2.1',
    :submodules => true
  }

  s.swift_version = "5"
  s.pod_target_xcconfig = {
      'SWIFT_VERSION' => '5.0'
  }
  s.source_files  = "Source/SocketIO/**/*.swift", "Source/SocketIO/*.swift"
  s.dependency "QuaNode-Starscream"
end
