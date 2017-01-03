class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    authorize! :index, @project
    #prevents the user from accessing the projects page directly
  end
end
