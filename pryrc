Pry.config.editor = 'emacs'

# Provides OS detection helper methods.
module OS
  # @return [Boolean] Truthy if executing on a Windows system.
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  # @return [Boolean] Truthy if executing on an OS X system.
  def OS.mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  # @return [Boolean] Truthy if executing on any flavor of Unix (even OS X).
  def OS.unix?
    !OS.windows?
  end

  # @return [Boolean] Truthy if executing on any flavor of Linux.
  def OS.linux?
    OS.unix? && !OS.mac?
  end
end

class String
  # Copies the contents of the string to the OS X clipboard.
  def to_clipboard
    fail "String#to_clipboard is not defined for #{RUBY_PLATFORM}" unless OS.mac?

    IO::popen('pbcopy', 'w') { |io| io.write(self) } && self
  end
end
