class ProjectsController < ApplicationController
    #home page
    #all projects displayed in descending order, so most recent project is shown
    def index
        @projects = Project.all.order('created_at DESC')
    end
    
    #show method - project Views (project.rb) and show Views (show.html.erb)
    #results shown when 'more' is selected by user in index/home page
    #params[:id] passed as parameters
    #ie. a project is identified with an id number (for example:../projects/1)
    #so it will find the project selected according to id number to show to user
    def show
        @project = Project.find(params[:id])
    end
    
    #new method - project Model (project.rb) and new Views (new.html.erb)
    #results shown when 'create project' is selected by user in the index/home page
    def new
        @project = Project.new
    end
    
    #create method - project Model(project.rb) and new Views (new.html.erb)
    #method has 'project_params' passed as parameters
    #which requires values specified in the project_params method
    #if else statement for 'save' function to redirect user to the show Views
    #or else re-render the current page, new Views 
    def create
        @project = Project.new(project_params)
        
        if @project.save
        redirect_to @project
        else
       render 'new' 
        end
    end
    
    #edit method -project Model (project.rb) and edit Views(edit.html.erb)
    #params[:id] passed as parameters
    #ie. a project is identified with an id number (for example:../projects/1)
    #so it will find according to id number, the project selected by the user 
    #and show the edit Views format with the project details
    def edit
         @project = Project.find(params[:id])
    end
    
    #update method - project Model(project.rb) and edit Views (edit.html.erb)
    #respinsible for updating a project based on id params
    #ie. a project is identified with an id number (for example:../projects/1)
    #so it will find according to id number, the project selected by the user 
    #and show the edit Views
    #if the project based on project_params (ie. name, season, category is passed) exists
    #the project will be updated and saved and user is redirected
    #otherwise re-renders page (edit project Views)
    def update
         @project = Project.find(params[:id])
         
        if(@project.update(project_params))
            redirect_to @project
        else
            render 'edit' 
        end
    end
    
    #destroy method - project Model(project.rb) and show Views (show.html.erb)
    #to get the project by id
    #and delete that particular project, redirect to current page
    def destroy
         @project = Project.find(params[:id])
         @project.destroy

         redirect_to projects_path
    end
    
    #project_params method to allow only values: name, season, category.
    #used as a parameter passed in the create method
    private def project_params
        params.require(:project).permit(:name, :season, :category)
    end
    
end
