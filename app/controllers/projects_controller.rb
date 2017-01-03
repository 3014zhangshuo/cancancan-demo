class ProjectsController < ApplicationController
    def index
        @projects = Project.all
        authorize! :index, @project
        # prevents the user from accessing the projects page directly
    end

    def new
      @project = Project.new
      authorize! :new, @project
  end

    def create
      @project = Project.new(project_params)
       if @project.save
        flash[:success] = 'Project was saved!'
        redirect_to projects_path
       else
          render 'new'
        end
        authorize! :create, @project
    end

    private

    def project_params
        params.require(:project).permit(:title)
    end
end
