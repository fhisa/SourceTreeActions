#!/usr/bin/ruby

if not ARGV.empty?
  Dir.chdir ARGV[0]
  folder = Dir["*.xcworkspace", "*.xcodeproj"].first
  if folder
    system "open -a Xcode #{folder}"
  else
    STDERR.puts "error: Not Xcode project folder."
    exit 1
  end
end
