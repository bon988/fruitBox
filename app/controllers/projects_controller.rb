class ProjectsController < ApplicationController
    #home page
    def index
        @projects = Project.all
    end
    
    #page to show result of a project creation 
    def show
        @project = Project.find(params[:id])
    end
    
    #page to allow user to create a project
    def new
        @project = Project.new
    end
    
    #create method (CRUD)
    def create
        @project = Project.new(project_params)
        
        if @project.save
        redirect_to @project
        else
       render 'new' 
        end
    end
    
    #update method (CRUD)
    def edit
         @project = Project.find(params[:id])
    end
    
    #update method (CRUD)
    def update
         @project = Project.find(params[:id])
         
        if(@project.update(project_params))
            redirect_to @project
        else
            render 'edit' 
        end
    end
    
    #delete method (CRUD)
    def destroy
         @project = Project.find(params[:id])
         @project.destroy
         
         redirect_to_projects_path
    end
    
    #method project_params to allow only name, season, category variables to be created
    #used as a parameter passed in the create method
    private def project_params
        params.require(:project).permit(:name, :season, :category)
    end
    
end
