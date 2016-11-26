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
        
        if params[:force_choice] == "None"
            @group.force_matched_project = nil
        else
            force_project = Project.find(params[:force_choice])
            if force_project.force_matched_group and force_project.force_matched_group != @group
                flash[:notice] = "Update unsuccessful. Project " + force_project.project_name +
                                  " already matched to group " + force_project.force_matched_group.group_name
                redirect_to '/groups/' + params[:id].to_s
                return
            else
                @group.force_matched_project = force_project
            end
        end
        
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
            Group.find(params[:delete].keys).each do |group|
                group.destroy
            end
        rescue NoMethodError
            flash[:notice] = "No group selected"
            redirect_to :groups
            return
        end
        redirect_to :groups
    end
    
    def destroy
        begin
            Group.find(params[:id]).destroy
        rescue ActiveRecord::RecordNotFound
            flash[:notice] = "No group selected"
            redirect_to :groups
            return
        end
        redirect_to :groups
    end
    
end
