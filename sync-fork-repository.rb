#!/usr/bin/ruby

# forkしたリポジトリのmasterをfork元に同期させる。

class WorkingCopyKeeper

  def execute(&block)
    @saved_branch = current_branch
    if not system('git stash save')
      usage 'git stash save failed.'
      exit 1
    end
    begin
      err = block.call
      usage(err) if err
    ensure
      system "git checkout #{@saved_branch}"
      system 'git stash pop'
    end
  end

  private

  def usage(msg)
    $stderr.puts "#{File.basename($0)}: #{msg}"
  end

  def current_branch
    pattern = /^\*\s+(.*)$/
    `git branch`.each_line do |line|
      if match = pattern.match(line)
        return match[1]
      end
    end
    nil
  end
end

Dir.chdir ARGV[0] if not ARGV.empty?

WorkingCopyKeeper.new.execute do
  break 'git checkout master' if not system'git checkout master'
  break 'git fetch upstream' if not system 'git fetch upstream'
  break 'git merge upstream/master' if not system 'git merge upstream/master'
  break 'git push origin master' if not system 'git push origin master'
end
