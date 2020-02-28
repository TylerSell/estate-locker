class PlansController < ApplicationController

    get '/plans/new' do 
        redirect_if_not_logged_in
        @user = current_user
        @family_members = @user.family_members 
        erb :'/plans/new'
    end

    post '/plans/new' do 
        redirect_if_not_logged_in
        @user = current_user
        @family_member = FamilyMember.find_by_id(params[:family_member])
        @plan = @family_member.plans.create(:kind_of_plan => params[:kind_of_plan], :company => params[:company], :account_number => params[:account_number], :contact_number => params[:contact_number], :beneficiary => params[:beneficiary], :notes => params[:notes], :user_id => @user.id)
        redirect '/family_members'
    end

    get '/plans/:id' do 
        redirect_if_not_logged_in
        @plan = Plan.find_by_id(params[:id])
        @family_member = FamilyMember.find_by_id(@plan.family_member_id)
        erb :'/plans/show'
    end

    get '/plans/:id/edit' do 
        redirect_if_not_logged_in
        @user = current_user
        @plan = Plan.find_by_id(params[:id])
        @family_members = @user.family_members
        @family_member = FamilyMember.find_by_id(@plan.family_member_id)
        erb :'/plans/edit'
    end

    patch '/plans/:id' do 
        @plan = Plan.find_by_id(params[:id])
        @plan.family_member_id = params[:family_member]
        @plan.kind_of_plan = params[:kind_of_plan]
        @plan.company = params[:company]
        @plan.account_number = params[:account_number]
        @plan.contact_number = params[:contact_number]
        @plan.beneficiary = params[:beneficiary]
        @plan.notes = params[:notes]
        @plan.save
        redirect '/family_members'
    end

    get '/plans/:id/delete' do 
        redirect_if_not_logged_in
        @plan = Plan.find_by_id(params[:id])
        @family_member = FamilyMember.find_by_id(@plan.family_member_id)
        erb :'/plans/delete'
    end

    delete '/plans/:id' do 
        @plan = Plan.find_by_id(params[:id])
        @plan.destroy
        redirect '/family_members'
    end

end


