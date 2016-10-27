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
        @group[:fourth_choice] = params[:fourth_choice]
        @group[:fifth_choice] = params[:fifth_choice]
        @group[:sixth_choice] = params[:sixth_choice]
        @group[:seventh_choice] = params[:seventh_choice]
        arr = [params[:first_choice], params[:second_choice], params[:third_choice],
               params[:fourth_choice], params[:fifth_choice], params[:sixth_choice], params[:seventh_choice]]
        if arr.length != arr.uniq.length
            flash[:notice] = "Update unsuccessful. Preferences must be unique."
            @group = Group.find(params[:id])
            redirect_to '/groups/' + params[:id]
        else
            @group.save
            redirect_to :groups
        end
    end
    
    def index
        @groups = Group.all
    end
    
    def destroy_multiple
        params[:delete].keys.each do |id|
            Group.destroy(id)
        end
        redirect_to :groups
    end
    
    def destroy
        Group.destroy(params[:id])
        redirect_to :groups
    end
    
end
