class FamilyMemberController < ApplicationController

    get '/family_members/new' do 
        redirect_if_not_logged_in
        erb :'/family_members/new'
    end

