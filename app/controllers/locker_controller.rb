class LockerController < ApplicationController
  def new
    @locker = Locker.new
  end
  
  def splash
  end
  
  def view
  end
  
  def index
  end
  
  def create
    @locker = Locker.new(locker_params)
    if(@locker.save)
      @locker.update(number: @locker.id)
      redirect_to '/locker'
    else
      redirect_to '/locker'
    end
  end
  
  

  def locker_params
    params.require(:locker).permit(:number, :size) #permit user to enter number and student fields 
  end
end
