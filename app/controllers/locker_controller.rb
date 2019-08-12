
class LockerController < ApplicationController
  @@sorted = Locker.find_each()
  
  def new
    @locker = Locker.new
  end

  
  def splash
    if user_signed_in?
      redirect_to locker_index_path
    end
  end
  
  def view
  end
  
  def many_new
    i = 0
    num = params[:anything][:first].to_i
    locker = {"size"=>"", "number"=>"", "student_first_name"=>"", "student_last_name"=>"", "instrument"=>"", "ensemble"=>""}
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
     if(@locker.student_first_name == "")
       @locker.update(student_first_name: "-")
     end
     if(@locker.student_last_name == "")
       @locker.update(student_last_name: "-")
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
    session[:forward] = session[:forward] == true ? false : true 
    puts(session[:forward])
    if(params[:type] == "status")
      session[:type] = "student_last_name"
      puts("************")
      session[:status] = "yes"
    else
      session[:type] = params[:type]
      puts("^^^^^^^^^^^^^^6")
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
    params[:locker][:student_first_name] ? locker.update(student_first_name: params[:locker][:student_first_name]) : nil
    params[:locker][:student_last_name] ? locker.update(student_last_name: params[:locker][:student_last_name]) : nil
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
      if(@locker.student_first_name == "")
        @locker.update(student_first_name: "-")
      end
      if(@locker.student_last_name == "")
        @locker.update(student_last_name: "-")
      end
      if(@locker.instrument == "")
        @locker.update(instrument: "-")
      end
      if(@locker.ensemble == "")
        @locker.update(ensemble: "-")
      end
    end
    redirect_to '/locker'
  end

  
  

  def locker_params
    params.require(:locker).permit(:number, :size, :student_first_name, :student_last_name, :instrument, :ensemble) #permit user to enter number and student fields 
  end
end
