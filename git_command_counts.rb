require 'pp'

# This Ruby script reads your command line history, and counts up
# the number of times you have used different git commands.
# It supports *nix operating systems with a .bash_history
# file in their home directory. This script hasn't been tested
# on systems that don't meet those requirements.
#
# You can run this script by navigating to the directory it is
# located in and typing the command `ruby git_command_counts.rb`
# This assumes a Ruby interpreter is installed on your computer.

git_command_counts = Hash.new(0)

File.open(File.expand_path('~/.bash_history'), 'r') do |f|
  f.each_line { |line| git_command_counts[line.split[0...2].join(' ')] += 1 if line =~ /^git/ }
end

pp git_command_counts.sort_by { |_, count| count }.reverse.to_h

