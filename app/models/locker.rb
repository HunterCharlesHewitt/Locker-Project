class Locker < ActiveRecord::Base
    #validates(:number, presence: true) #enforce number is always present
    #validates(:size, presence: true) #enforce student is always present 
 
  def self.my_order(type, status) #expects an already ordered hash 
    if(status == "yes")
        return Locker.order(type)
    end
    type = type == "status" ? "student" : type
    dash_list = []
    order_list = []
    Locker.order(type).each do |lock|
    if(lock.send(type) == "" or lock.send(type) == "-")
      dash_list.push(lock)
    else
      order_list.push(lock)
    end
    end
    order_list.concat(dash_list)
    return order_list
  end
end
