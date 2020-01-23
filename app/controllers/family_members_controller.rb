class FamilyMembersController < ApplicationController

    get '/family_members/new' do 
        redirect_if_not_logged_in
        erb :'/family_members/new'
    end

    post '/family_members/new' do 
        @user = current_user
        @family_member = @user.family_members.create(:first_name => params[:first_name], :last_name => params[:last_name], :date_of_birth => params[:date_of_birth])
        redirect '/family_members'
    end

    get '/family_members/:id' do 
        redirect_if_not_logged_in
        @family_member = FamilyMember.find_by_id(params[:id])
        @plans = @family_member.plans 
        erb :'/family_members/show'
    end

    get '/family_members/:id/edit' do 
        redirect_if_not_logged_in
        @family_member = FamilyMember.find_by_id(params[:id])
        erb :'/family_members/edit'
    end

    patch '/family_members/:id' do 
        @family_member = FamilyMember.find_by_id(params[:id])
        @family_member.first_name = params[:first_name]
        @family_member.last_name = params[:last_name]
        @family_member.date_of_birth = params[:date_of_birth]
        @family_member.save
        redirect '/family_members'
    end

    get '/family_members/:id/delete' do 
        redirect_if_not_logged_in
        @family_member = FamilyMember.find_by_id(params[:id])
        erb :'/family_members/delete'
    end

    delete '/family_members/:id' do 
        @family_member = FamilyMember.find_by_id(params[:id])
        @family_member.destroy
        redirect '/family_members'
    end

end


