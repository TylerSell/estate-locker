class PlansController < ApplicationController

    get '/plans/new' do 
        redirect_if_not_logged_in
        @family_members = FamilyMember.all 
        erb :'/plans/new'
    end

    post '/plans/new' do 
        redirect_if_not_logged_in
        @user = current_user
        @family_member = FamilyMember.find_by_id(params[:family_member])
        @plan = @family_member.plans.create(:kind_of_plan => params[:kind_of_plan], :company => params[:company], :account_number => params[:account_number], :contact_number => params[:contact_number])
        redirect '/family_members'
    end

    get '/plans/:id' do 
        redirect_if_not_logged_in
        @plan = Plan.find_by_id(params[:id])
        erb :'/plans/show'
    end

    get '/plans/:id/edit' do 
        redirect_if_not_logged_in
        @plan = Plan.find_by_id(params[:id])
        @family_member = @plan.family_member
        @family_members = FamilyMember.all
        erb :'/plans/edit'
    end

    patch '/plans/:id' do 
        @plan = Plan.find_by_id(params[:id])
        @plan.family_member = params[:family_member]
        @plan.kind_of_plan = params[:kind_of_plan]
        @plan.company = params[:company]
        @plan.account_number = params[:account_number]
        @plan.contact_number = params[:contact_number]
        @plan.save
        redirect '/family_members'
    end

    get '/plans/:id/delete' do 
        redirect_if_not_logged_in
        @plan = Plan.find_by_id(params[:id])
        erb :'/plans/delete'
    end

    delete '/plans/:id' do 
        @plan = Plan.find_by_id(params[:id])
        @plan.destroy
        redirect '/family_members'
    end

end


