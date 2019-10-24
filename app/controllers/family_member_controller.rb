class FamilyMemberController < ApplicationController

    get '/family_members/new' do 
        redirect_if_not_logged_in
        erb :'/family_members/new'
    end

    post '/family_members/new' do 
        @user = current_user
        @family_member = @user.family_members.create(:name => params[:name])
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
        erb :'family_members/edit'
    end

    patch '/family_members/:id' do 
        @family_member = FamilyMember.find_by_id(params[:id])
        @family_member.name = params[:name]
        @family_member.save
        redirect '/family_members'
    end

    get '/family_members/:id/delete' do 
        redirect_if_not_logged_in
        @family_member = FamilyMember.find_by_id(params[:id])
        erb :'family_members/delete'
    end

    delete '/family_members/:id' do 
        @family_member = FamilyMember.find_by_id(params[:id])
        @family_member.destroy
        redirect 'family_members'
    end

end


