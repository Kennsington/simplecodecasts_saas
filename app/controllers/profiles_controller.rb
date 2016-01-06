class ProfilesController < ApplicationController
    def new
        #pseudo code: form where each user can fill out their own profile.
        @user = User.find( params[:user_id] )# this params argument determines who is logged in
        @profile = @user.build_profile
    end
    
end