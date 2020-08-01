Pod::Spec.new do |spec|
  spec.name         = 'libwebp'
  spec.version      = '1.1.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://developers.google.com/speed/webp/'
  spec.authors      = 'Google Inc.'
  spec.summary      = 'Library to encode and decode images in WebP format.'
  spec.source       = { :git => 'https://github.com/webmproject/libwebp.git', :tag => 'v1.1.0' }
  spec.source_files = 'src/mux/*.{h,c}', 'src/webp/mux.h'
  spec.swift_version = '5.0'
  spec.license = 'BSD'
  spec.requires_arc = false
  #spec.prepare_command = "sed -i.bak 's/<inttypes.h>/<stdint.h>/g' './src/webp/types.h'"
  spec.compiler_flags = '-D_THREAD_SAFE'
  spec.preserve_path = 'src'
  spec.pod_target_xcconfig = { 'USER_HEADER_SEARCH_PATHS': '$(inherited) ${PODS_ROOT}/libwebp/ ${PODS_TARGET_SRCROOT}/' }
  
  spec.default_subspecs = 'webp', 'demux', 'mux'
  
  spec.subspec 'webp' do |w|
    w.source_files = 'src/webp/decode.h', 'src/webp/encode.h', 'src/webp/types.h', 'src/webp/mux_types.h', 'src/webp/format_constants.h', 'src/utils/*.{h,c}', 'src/dsp/*.{h,c}', 'src/dec/*.{h,c}', 'src/enc/*.{h,c}'
    w.public_header_files = 'src/webp/decode.h', 'src/webp/encode.h', 'src/webp/types.h', 'src/webp/mux_types.h', 'src/webp/format_constants.h'
  end
  
  spec.subspec 'demux' do |d|
    d.dependency 'libwebp/webp'
    d.source_files = 'src/demux/*.{h,c}', 'src/webp/demux.h'
    d.public_header_files = 'src/webp/demux.h'
  end
  
  spec.subspec 'mux' do |m|
    m.dependency 'libwebp/demux'
    m.source_files = 'src/mux/*.{h,c}', 'src/webp/mux.h'
    m.public_header_files = 'src/webp/mux.h'
  end
  
end
