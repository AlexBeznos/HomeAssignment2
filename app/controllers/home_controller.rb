class HomeController < ApplicationController
  def index
  end

  def update
    Robot.destroy_all
    directory = "public/uploads"
    name = params[:input_data].original_filename
    path = File.join(directory, name)
    File.open(path, "wb") {|f| f.write(params[:input_data].read)}
  	File.new("public/uploads/" + name, "r").each { |line| Robot.inputer(line)}
  	@robots = Robot.all
  end

  def research
  end
end
