class HomeController < ApplicationController
  def index
  end

  def update
    %x[rake db:rollback] // This is the rake comand for absolute deleting the tabel
    %x[rake db:migrate] // And this is for new creation of the table. It was done for making to start count identifiers from the 1 and not from the last one, which was deleted previously.
    directory = "public/uploads"
    name = params[:input_data].original_filename
    path = File.join(directory, name)
    File.open(path, "wb") {|f| f.write(params[:input_data].read)} // Read and create new file which was uploaded from the user
  	File.new("public/uploads/" + name, "r").each { |line| Robot.inputer(line)} // here we start to fill in just created table
  	@robots = Robot.all
  end

  def research
  end
end
