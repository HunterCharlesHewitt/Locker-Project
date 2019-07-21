
class LockerController < ApplicationController
  @@sorted = Locker.find_each()
  
  def new
    @locker = Locker.new
  end
  
  def sign_in
    if(params[:anything][:password] == "MUSATAMU")
      session[:signed_in] = true
      redirect_to locker_index_path
    else
      flash[:warning] = "Enter Correct Password"
      session[:signed_in] = false
       redirect_to root_path
    end
  end
  
  def logout
    session[:signed_in] = false
    redirect_to root_path
  end
  
  def splash
    if(!(session[:email].nil?))
      redirect_to locker_index_path
    end
     
  end
  
  def view
  end
  
  def many_new
    i = 0
    num = params[:anything][:first].to_i
    locker = {"size"=>"", "number"=>"", "student"=>"", "instrument"=>"", "ensemble"=>""}
    params[:locker] = locker
    while( i < params[:anything][:number].to_i )
      i+=1
     @locker = Locker.new(locker_params)
     @locker.save
     if(num > -1)
       @locker.update(number: num)
       num+=1
     else
       @locker.update(number: @locker.id)
     end
     @locker.update(size: params[:anything][:size])
     if(@locker.student == "")
       @locker.update(student: "-")
     end
     if(@locker.instrument == "")
       @locker.update(instrument: "-")
     end
     if(@locker.ensemble == "")
       @locker.update(ensemble: "-")
     end
    end
    redirect_to locker_index_path
  end
  
  def sort
    if(params[:type] == "status")
      session[:type] = "student"
      puts("************")
      session[:status] = "yes"
    else
      session[:type] = params[:type]
      puts("7^^^^^^^^^^^^^^6")
      session[:status] = "no"
    end
    puts session[:type]
    redirect_to locker_index_path
  end
  
  def index
  end
  
  respond_to :html, :json

  def update
    locker = Locker.find(params[:id])
    params[:locker][:number] ? locker.update(number: params[:locker][:number]) : nil
    params[:locker][:student] ? locker.update(student: params[:locker][:student]) : nil
    params[:locker][:size] ? locker.update(size: params[:locker][:size]) : nil
    params[:locker][:ensemble] ? locker.update(ensemble: params[:locker][:ensemble]) : nil
    params[:locker][:instrument] ? locker.update(instrument: params[:locker][:instrument]) : nil
    respond_with(locker)
  end
  
  def create
    @locker = Locker.new(locker_params)
    if(@locker.save)
      if(@locker.number == "")
        @locker.update(number: @locker.id)
      end
      if(@locker.size == "")
        @locker.update(size: "-")
      end
      if(@locker.student == "")
        @locker.update(student: "-")
      end
      if(@locker.instrument == "")
        @locker.update(instrument: "-")
      end
      if(@locker.ensemble == "")
        @locker.update(ensemble: "-")
      end
      redirect_to '/locker'
    else
      redirect_to '/locker'
    end
  end

  
  

  def locker_params
    params.require(:locker).permit(:number, :size, :student, :instrument, :ensemble) #permit user to enter number and student fields 
  end
end
