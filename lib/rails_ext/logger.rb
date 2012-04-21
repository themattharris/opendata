class Logger

  def echo_and_log(level, message)
    puts message
    self.send(level, message)
  end

end