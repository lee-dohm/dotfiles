Pry.config.editor = 'atom'

# Provides OS detection helper methods.
module OS
  # @return [Boolean] Truthy if executing on a Windows system.
  def self.windows?
    !(/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
  end

  # @return [Boolean] Truthy if executing on an OS X system.
  def self.mac?
    !(/darwin/ =~ RUBY_PLATFORM).nil?
  end

  # @return [Boolean] Truthy if executing on any flavor of Unix (even OS X).
  def self.unix?
    !OS.windows?
  end

  # @return [Boolean] Truthy if executing on any flavor of Linux.
  def self.linux?
    OS.unix? && !OS.mac?
  end
end

# Default Command Set, add custom methods here:
default_command_set = Pry::CommandSet.new do
  command 'pbcopy', 'Copy to clipboard' do |str|
    str = "#{_pry_.input_array[-1]}#=> #{_pry_.last_result}\n" unless str
    IO.popen('pbcopy', 'r+') { |io| io.puts str }
    output.puts "-- Copy to clipboard --\n#{str}"
  end
end
