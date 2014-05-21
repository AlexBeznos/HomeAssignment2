class HomeController < ApplicationController
  def index
  end

  def update
  	file = params[:input_data]
  	if File.extname(file) == '.txt'
  		File.new(file, "r").each { |line| Robot.inputer(line)}
  	else
  		redirect_to root_path, alert: "You have uploaded wrong type of file! Try to reload it!"
  	end
  end

  def research
  end
end
