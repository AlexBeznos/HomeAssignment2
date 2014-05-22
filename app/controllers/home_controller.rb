class HomeController < ApplicationController
  def index
  end

  def update
    Robot.destroy_all
  	File.new("public/uploads/file.txt", "r").each { |line| Robot.inputer(line)}
  	@robots = Robot.all
  end

  def research
  end
end
