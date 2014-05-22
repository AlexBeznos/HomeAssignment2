class Robot < ActiveRecord::Base

  def self.inputer(line)
  	type = Robot.whilenes(line, 0)
  	name = Robot.whilenes(line, 1)
  	mistake = Robot.whilenes(line, 2).to_i
  	speed = Robot.whilenes(line, 3).to_i
    operations = Robot.whilenes(line, 4).to_i
    size = Robot.whilenes(line, 5).to_i
    intelect = Robot.boolean(Robot.whilenes(line, 6))
    discharge = Robot.whilenes(line, 7)
    price = Robot.whilenes(line, 8).to_f
    integral = mistake + speed + operations + size + culc_in(intelect)  + culc_dis(discharge) + price 
    Robot.create(type: type, name: name, mistake: mistake, speed: speed, operations: operations, size: size, intelect: intelect, discharge: discharge, price: price, integral: integral)
  end
  
  def self.whilenes(line, numb)
    word = ""
    quontity = 0
    puts(line)
    while quontity == numb+1 do
      if quontity > numb and quontity < numb + 1
      	word = word + line[i]
      end
      if line[i] = "|"
      	quontity+=1
      end
    end
    return word
  end

  def self.culc_in(num)
  	i = 0
  	i = 10 if num == true
  	return i
  end

  def self.culc_dis(time)
  	hour = ""
  	min = ""
  	for i in 1..time.length do
  		break if time[i] == "-"
  		hour = hour + time[i]
    end
    i=+1
    for j in i..time.length do
    	min = min + time[j]
    end
    return hour.to_i*60+min.to_i
  end

  def self.boolean(str)
  	str == "true" ? true : false
  end

end
