require 'pp'

git_command_counts = Hash.new(0)

File.open(File.expand_path('~/.bash_history'), 'r') do |f|
  f.each_line { |line| git_command_counts[line.split[0...2].join(' ')] += 1 if line =~ /^git/ }
end

pp git_command_counts.sort_by { |_, count| count }.reverse.to_h

