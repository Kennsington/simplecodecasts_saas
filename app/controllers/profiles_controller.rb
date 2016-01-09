class ProfilesController < ApplicationController
  before_action :authenticate_user! #:authenticate user comes from devise gem
  before_action :only_current_user
    def new
        #pseudo code: form where each user can fill out their own profile.
        @user = User.find( params[:user_id] )# this params argument determines who is logged in
        @profile = Profile.new
    end
    
    def create
        @user = User.find( params[:user_id] )
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = "Your profile has been updated!"
            redirect_to user_path( params[:user_id] ) 
        else
            render action: :new #if error occurs renders new action above to restart update profile
        end
    end
    
    def edit
         @user = User.find( params[:user_id] )
         @profile = @user.profile
    end
    
    def update
        @user = User.find( params[:user_id] )
        @profile = @user.profile
        if @profile.update_attributes(profile_params)
            flash[:success] = "Your profile has been updated."
            redirect_to user_path( params[:user_id] ) 
        else 
            render action: :edit
        end
    end
    
    private
    #Necessary to whiteist arguments that make up the profile paramaters
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
        end
        
        def only_current_user
           @user = User.find( params[:user_id] )
           redirect_to(root_url) unless @user == current_user #current_user from devise, @user from user_id in url
        end
end