class FamilyMemberController < ApplicationController

    get '/family_members' do 
        redirect_if_not_logged_in
        @user = current_user
        @family_members = @user.family_members
        erb :'family_members/show'
    end

    