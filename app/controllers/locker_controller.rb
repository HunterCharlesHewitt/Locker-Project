class LockerController < ApplicationController
  def new
    @locker = Locker.new
  end
  
  def splash
  end
  
  def view
  end
  
  def create
    @locker = Locker.new(locker_params)
    if(@locker.save)
      redirect_to '/locker'
    else
      redirect_to '/locker'
    end
  end
  
  

  def locker_params
    params.require(:locker).permit(:number, :size) #permit user to enter number and student fields 
  end
end
