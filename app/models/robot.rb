class Robot < ActiveRecord::Base
  self.inheritance_column = nil

  def self.inputer(line)
    array = line.split('|')
  	boo = array[0]
  	name1 = array[1]
  	mistake1 = array[2].to_i
  	speed1 = array[3].to_i
    operations1 = array[4].to_i
    size1 = array[5].to_i
    intelect1 = Robot.boolean(array[6])
    discharge1 = array[7]
    price1 = array[8].to_f
    integral1 = mistake1 + speed1 + operations1 + size1 + culc_in(intelect1)  + culc_dis(discharge1) + price1 
    Robot.create(type: boo, name: name1, mistake: mistake1, speed: speed1, operations: operations1, size: size1, intelect: intelect1, discharge: discharge1, price: price1, integral: integral1)
  end

  def self.culc_in(num)
  	i = 0
  	i = 10 if num == true
  	return i
  end

  def self.culc_dis(time)
  	arr = time.split('-')
    return arr[0].to_i*60+arr[1].to_i
  end

  def self.boolean(str)
  	str == "true" ? true : false
  end

  def self.finder(integral, type)
    i = -1
    b = []
    c = []
    Robot.where(type: type).each do |robot|
      if robot.integral > integral
        b.push([ robot.id, (robot.integral - integral).round(2) ])
      else
        b.push([ robot.id, (integral - robot.integral).round(2) ])
      end
    end
    b.sort_by {|ele| ele[1] }.each do |b|
      i += 1
      c[i] = b[0]
    end
    return c.take(3)
  end
end
