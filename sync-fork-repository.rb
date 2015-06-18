#!/usr/bin/ruby

# forkしたリポジトリのmasterをfork元に同期させる。

Dir.chdir ARGV[0] if not ARGV.empty?
exit 1 if not system("git checkout master")
exit 1 if not system("git fetch upstream")
exit 1 if not system("git merge upstream/master")
exit 1 if not system("git push origin master")
system("git checkout mod")
