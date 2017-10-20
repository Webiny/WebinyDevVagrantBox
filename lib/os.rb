module os
  def os.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def os.mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def os.unix?
    !os.windows?
  end

  def os.linux?
    os.unix? and not os.mac?
  end
end