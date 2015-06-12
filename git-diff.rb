#!/usr/bin/ruby

args = ARGV[0..1].reverse
path = "/tmp/git-diff-#{args.join('_')}.diff"
result = `git diff #{args.join(' ')}`
exit 0 if result.empty?

open(path, "w") do |io|
  io.puts "git diff #{args.join(' ')}"
  io.write result
  io.flush
end

system "/usr/local/bin/atom #{path}"
