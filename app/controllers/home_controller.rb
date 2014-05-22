class HomeController < ApplicationController
  def index
  end

  def update
    Robot.destroy_all
    upload = params[:input_data]
    File.open(Rails.root.join('public', 'uploads', upload.original_filename), 'w') do |file|
      upload = upload.to_s.encode('UTF-8', {:invalid => :replace, :undef => :replace, :replace => '?'})
      file.write(upload.to_file.read)
    end
  	File.new("public/uploads/file.txt", "r").each { |line| Robot.inputer(line)}
  	@robots = Robot.all
  end

  def research
  end
end
