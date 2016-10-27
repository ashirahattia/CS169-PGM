class ProjectsController < ApplicationController
    def index
    end
    
    def new
        if params.key?(:project_name)
            name = params[:project_name]
            project = Project.create(project_name: name)
            flash[:notice] = "Project " + name + " successfully added"
        end
    end
    
    def update
    end

end
