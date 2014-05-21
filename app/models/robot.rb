class Robot < ActiveRecord::Base

  def self.inputer(line)
  	type = whilenes(line, 0)
  	name = whilenes(line, 1)
  	mistake = whilenes(line, 2).to_i
  	speed = whilenes(line, 3).to_i
    operations = whilenes(line, 4).to_i
    size = whilenes(line, 5).to_i
    intelect = whilenes(line, 6).to_boolean
    discharge = whilenes(line, 7)
    price = whilenes(line, 8).to_f
    integral = mistake + speed + operations + size + culc_in(intelect) + culc_dis(discharge) + price 
    Robot.create(type: type, name: name, mistake: mistake, speed: speed, operations: operations, size: size, intelect: intelect, discharge: discharge, price: price, integral: integral)
  end
  
  def whilenes(line, numb)
    word = ""
    quontity = 0
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

  def culc_in(num)
  	i = 0
  	i = 10 if num
  	return i
  end

  def culc_dis(time)
  	hour = ""
  	min = ""
  	for i in 1..time.lenth do
  		break if time[i] == "-"
  		hour = hour + time[i]
    end
    for j in i+1..time.length do
    	min = min + time[j]
    end
    return hour*60+min
  end
end
