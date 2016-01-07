class ProfilesController < ApplicationController
    def new
        #pseudo code: form where each user can fill out their own profile.
        @user = User.find( params[:user_id] )# this params argument determines who is logged in
        @profile = @user.build_profile
    end
    
    def create
        @user = User.find(params [:user_id])
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = "Your profile has been updated!"
            redirect_to user_path(params[:user_id]) 
        else
            render action: :new #if error occurs renders new action above to restart update profile
        end
    end
    
    private
    #Necessary to whiteist arguments that make up the profile paramaters
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :phone_number, :contact_email, :description)
        end
end