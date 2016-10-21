class GroupsController < ApplicationController
    include GroupsHelper

    def show
        @group = Group.find(params[:id])
        @projects = Project.all
    end
    
    def update
        @group = Group.find(params[:id])
        @projects = Project.all
        @group[:first_choice] = params[:first_choice]
        @group[:second_choice] = params[:second_choice]
        @group[:third_choice] = params[:third_choice]
        @group.save
        redirect_to '/groups/' + params[:id]
    end
    
end
