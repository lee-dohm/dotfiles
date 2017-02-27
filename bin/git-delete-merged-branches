#!/usr/bin/env ruby

require 'optparse'

# Original inspiration from:
# https://gist.github.com/bxt/566fd7de151bf73a937d

def prompt(text)
  print(text + ' ')
  gets
end

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: git delete-merged-branches [options]'

  opts.on('-bBRANCH', '--branch BRANCH', 'Branch to check for being merged into') do |b|
    options[:branch] = b
  end

  opts.on('-y', '--yes', 'Answer yes to all confirmations') do |y|
    options[:yes] = y
  end

  opts.on('-v', '--verbose', 'Verbose logging') do |v|
    options[:verbose] = v
  end

  opts.on('-h', '--help', 'Show this help information') do |h|
    puts opts
    exit
  end
end.parse!

main = options[:branch] || `git remote show origin | grep "HEAD branch" | sed "s/  HEAD branch: //"`.strip
branches = `git branch --merged #{main} | grep -v -e '#{main}\\|staging\\|development\\|\\*'`

if branches.strip.empty?
  puts "No merged branches to delete" if options[:verbose]
  exit 0
end

unless options[:yes]
  puts "Branches merged into #{main}"
  puts branches
  puts

  answer = prompt('Delete these branches (y/N)?')

  if answer.strip.downcase != 'y'
    puts "Aborting"
    exit 0
  end
end

branches.split.each do |branch|
  puts "Delete #{branch}" if options[:verbose]

  system("git branch -d #{branch}")
end
