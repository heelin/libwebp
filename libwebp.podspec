s.dependency do |p|
    p.name            = 'libwebp'
    p.version         = '0.3.0-rc7'
    p.summary         = 'Library to decode images in WebP format.'
    p.homepage        = 'https://developers.google.com/speed/webp/'
    p.author          = 'Google Inc.'
    p.license         = { :type => 'BSD', :file => 'COPYING' }
    p.source          = {
      :git => 'https://github.com/webmproject/libwebp.git',
      :tag => '1.1.0'
    }

    p.subspec 'dec' do |dec|
      dec.source_files = 'src/dec/*.{h,c}'
    end

    p.subspec 'dsp' do |dsp|
      dsp.exclude_files = 'src/dsp/enc*.c'
      dsp.source_files = 'src/dsp/*.{h,c}'
    end

    p.subspec 'utils' do |u|
      u.exclude_files = 'src/utils/{bit_writer,huffman_encode,quant_levels}.{h,c}'
      u.source_files = 'src/utils/*.{h,c}'
    end

    p.subspec 'webp' do |w|
      w.header_dir   = 'webp'
      w.source_files = 'src/webp/{decode,types,format_constants,mux_types}.h'
    end
  end
