class ProjectsController < ApplicationController
    
    def index
        @projects = Project.all
    end
    
    def show
        @project = Project.find(params[:id])
    end
    
    def new
        @project = Project.new
    end
    
    def create
        #render plain: params[:projects].inspect
        @project = Project.new(project_params)
        
        if @project.save
        redirect_to @project
        else
       render 'new' 
        end
    end
    
    private def project_params
        params.require(:project).permit(:name, :season, :category)
    end
    
end