class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end
    
    def new
        if params.key?(:project_name)
            name = params[:project_name]
            project = Project.create(project_name: name)
            # flash[:notice] = "Project " + name + " successfully added"
            redirect_to projects_path
        end
    end
    
    def update
    end

end
