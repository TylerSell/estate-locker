class PlanController < ApplicationController

    get '/plans/new' do 
        redirect_if_not_logged_in
        @family_members = FamilyMember.all 
        erb :'/plans/new'
    end

    post '/plans/new' do 
        redirect_if_not_logged_in
        @user = current_user
        @plan = @user.family_members.plan.create(:type => params[:type], :company => params[:company], :account_number => params[:account_number], :contact_number => params[:contact_number])
        redirect '/family_members'
    end

    get '/plans/:id' do 
        redirect_if_not_logged_in
        @plan = Plan.find_by_id(params[:id])
        erb :'/plans/show'
    end

    get '/plans/:id/edit' do 
        redirect_if_not_logged_in
        @family_member = FamilyMember.find_by_id(params[:id])
        erb :'plans/edit'
    end

    patch '/plans/:id' do 
        @family_member = FamilyMember.find_by_id(params[:id])
        @family_member.name = params[:name]
        @family_member.save
        redirect '/family_members'
    end

    get '/plans/:id/delete' do 
        redirect_if_not_logged_in
        @family_member = FamilyMember.find_by_id(params[:id])
        erb :'plans/delete'
    end

    delete '/plans/:id' do 
        @family_member = FamilyMember.find_by_id(params[:id])
        @family_member.destroy
        redirect 'family_members'
    end

end


