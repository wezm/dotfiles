require 'pathname'

ARGV.each do |path|
  path = Pathname(path)

  # See if this file has already been converted
  mkv = path.sub_ext('.mkv')
  if mkv.exist?
    puts "Found #{mkv}"
    next
  end

  # Check for it with a timestamp too (assumes no chars in path need escaping in glob)
  timestamped_mkv = mkv.parent.glob('*' + mkv.basename.to_s)
  if !timestamped_mkv.empty?
    puts "Found #{timestamped_mkv.first}"
    next
  end


  puts "Convert #{path}"
  ok = system 'ffmpeg', '-i', path.to_s, '-vf', 'zscale=t=linear:npl=100,format=gbrpf32le,zscale=p=bt709,tonemap=tonemap=hable:desat=0,zscale=t=bt709:m=bt709:r=tv,format=yuv420p', '-c:a', 'copy', mkv.to_s
  if !ok
    puts "ffmpeg error, stopping"
    exit 1
  end
end

