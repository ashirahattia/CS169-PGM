class GroupsController < ApplicationController
    include GroupsHelper
    include ApplicationHelper
    
    before_filter :check_logged_in

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
            redirect_to '/groups/' + params[:id].to_s
        else
            @group.save
            redirect_to :groups
        end
    end
    
    def index
        @groups = Group.all
    end
    
    def destroy_multiple
        begin
            params[:delete].keys.each do |id|
                Group.destroy(id)
            end
        rescue NoMethodError
            flash[:notice] = "No group selected"
            redirect_to :groups
            return
        end
        Match.destroy_all
        redirect_to :groups
    end
    
    def destroy
        begin
            Group.destroy(params[:id])
        rescue ActiveRecord::RecordNotFound
            flash[:notice] = "No group selected"
            redirect_to :groups
            return
        end
        Match.destroy_all
        redirect_to :groups
    end
    
end
