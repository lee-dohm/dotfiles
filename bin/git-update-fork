#!/usr/bin/env ruby
# rubocop:disable FileName

# Updates a GitHub forked project with the latest code from the original and pushes the updated code
# to the personal copy.
#
# Assumes that the original project is on the remote named `origin` and the personal copy is on a
# remote named with your GitHub user name. It will only merge by fast-forward and will not push to
# the personal copy unless the fetch and merge was successful.

require 'English'
require 'optparse'
require 'yaml'

# An error that occurred while executing a `git` command.
class GitError < StandardError
  attr_reader :status

  def initialize(status)
    @status = status
  end
end

# Executes a `git` command.
#
# @param [String] arguments Arguments to the `git` executable.
# @param [Hash] options
# @option options [Boolean] :out Flag indicating whether to return the output of the `git` command.
# @option options [Boolean] :verbose Flag indicating whether to display the text of the `git`
#                                    command.
#
# @raise [GitError] when the `git` command returns a non-zero exit code.
#
# @return [String, nil] Output of the `git` command, if `:out` is truthy; otherwise, `nil`.
def git(arguments, options = {})
  command = "git #{arguments}"
  puts command if options[:verbose]

  out = nil
  if options[:out]
    out = `#{command}`
  else
    system(command)
  end

  raise_git_error($CHILD_STATUS, command)

  out
end

# Retrieves your GitHub user name from either the `GITHUB_USER` environment variable or the
# `~/.config/hub` configuration file.
#
# @return [String] GitHub user name.
def github_user_name
  ENV['GITHUB_USER'] || YAML.load_file("#{ENV['HOME']}/.config/hub")['github.com'][0]['user']
end

# Raises an error if there was a problem executing the `git` command.
#
# @param status [Process::Status] Exit status of the `git` command.
# @param command [String] Command that was executed.
#
# @raise [GitError] when the `git` command returned a non-zero exit code.
def raise_git_error(status, command)
  raise GitError.new(status), "Error executing '#{command}'" unless status.exitstatus == 0
end

options = {}
parser = OptionParser.new do |opts|
  opts.banner = "Usage: #{opts.program_name} [options]"

  opts.on('-m', '--master MASTER', 'Name of the master branch. Defaults to "master".') do |m|
    options[:master] = m
  end

  opts.on('-o', '--origin ORIGIN', 'Name of the origin remote. Defaults to "origin".') do |o|
    options[:origin] = o
  end

  opts.on('-r', '--[no-]rebase', 'Rebase the current branch on top of the new master') do |r|
    options[:rebase] = r
  end

  opts.on('-p',
          '--personal PERSONAL',
          'Name of personal remote. Defaults to your GitHub user name.') do |personal|
    options[:personal] = personal
  end

  opts.on('-v', '--[no-]verbose', 'Display verbose output') do |v|
    options[:verbose] = v
  end

  opts.on('-h', '--help', 'Displays this help message') do
    puts opts
    exit
  end
end

parser.parse(ARGV)

master = options[:master] || 'master'
origin = options[:origin] || 'origin'
personal = options[:personal] || github_user_name
verbose = options[:verbose]

unless system("git remote | grep #{origin} > /dev/null 2>&1")
  puts "The upstream remote '#{origin}' could not be found"
  exit 2
end

alternate_branch = git('current-branch', out: true, verbose: verbose)
alternate_branch = nil if alternate_branch == master

git("checkout #{master}", verbose: verbose) unless alternate_branch.nil?

git("pull --ff-only #{origin} #{master}", verbose: verbose)
git("push #{personal} #{master}", verbose: verbose)

git("checkout #{alternate_branch}", verbose: verbose) unless alternate_branch.nil?

git("rebase #{master}", verbose: verbose) if alternate_branch && options[:rebase]
