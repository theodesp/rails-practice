class SayController < ApplicationController
  def hello
    @time = Time.now.httpdate
  end

  def goodbye
    @files = Dir.glob('*')
  end
end
