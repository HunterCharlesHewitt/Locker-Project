class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
    super
   end

  # POST /resource/sign_in
   def create
    #super
    self.resource = warden.authenticate!(auth_options)
    #set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource); yield resource if block_given?
    respond_with resource, location: locker_index_path
    session[:email] = params[:user][:email]
   end
   
   #if user is signed in
  def after_sign_in_path_for(_resource_or_scope)
    locker_index_path
  end

end