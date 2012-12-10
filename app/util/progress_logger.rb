class ProgressLogger
  def initialize interval
    @interval  = interval
    @count     = 0
  end

  def log
    @count = @count + 1

    if @count == @interval
      print "."
      @count = 0
    end
  end
end
