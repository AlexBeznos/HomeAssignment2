class HomeController < ApplicationController
  def index
    @types = Robot.all.map { |robo| [robo.type] }.uniq
  end

  def update
    %x[rake db:rollback] # This is the rake comand for absolute deleting the tabel
    %x[rake db:migrate] # And this is for new creation of the table. It was done for making to start count identifiers from the 1 and not from the last one, which was deleted previously.
    directory = "public/uploads"
    name = params[:input_data].original_filename
    path = File.join(directory, name)
    File.open(path, "wb") {|f| f.write(params[:input_data].read)} # Read and create new file which was uploaded from the user
  	File.new("public/uploads/" + name, "r").each { |line| Robot.inputer(line)} # here we start to fill in just created table
  	@robots = Robot.all
  end

  def research
    type = params[:type]
    speed = params[:speed].to_i
    mistake = params[:mistake].to_i
    operations = params[:operations].to_i
    size = params[:height].to_i * params[:width].to_i * params[:length].to_i
    params[:int][:init] == 1 ? intelect = 10 : intelect = 0
    discharge = params[:discharge].to_i
    price = params[:price].to_f.round(2)
    integral = speed + mistake + operations + size + discharge + intelect + price
    puts "Integral is equel to: #{integral}"
    ids = Robot.finder(integral, type)
    records = Robot.find(ids)
    @robots = ids.collect {|id| records.detect {|x| x.id == id}}
  end
end
