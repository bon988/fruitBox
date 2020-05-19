class ProjectsController < ApplicationController
    #home page
    #projects displayed in descending order (so most recent project is shown)
    def index
        @projects = Project.all.order('created_at DESC')
    end
    
    #method show - references project Views (project.rb) and show Views (show.html.erb)
    #results shown when 'more' is selected by user in index/home page
    #params[:id] passed as parameters
    #ie. a project is identified with an id number for example:../projects/1)
    #so it will find the project selected according to id number to show to user
    def show
        @project = Project.find(params[:id])
    end
    
    #method new - references project Model (project.rb) and new Views (new.html.erb)
    #results shown when 'create project' is selected by user in the index/home page
    #method created for the 'if statement' alert in the views new file
    def new
        @project = Project.new
    end
    
    #create method - references project Model(project.rb) and new Views  (new.html.erb)
    #method has 'project_params' passed as parameters
    #which requires values(specified in the project_params method) from user
    #if else statement for 'save' function to redirect user to the Views show
    #or else re-render the current page, new Views (render 'new')
    def create
        @project = Project.new(project_params)
        
        if @project.save
        redirect_to @project
        else
       render 'new' 
        end
    end
    
    #edit method - references Model project(project.rb) and Views edit(edit.html.erb)
    #params[:id] passed as parameters
    #ie. a project is identified with an id number for example:../projects/1)
    #so it will find according to id number, the project selected by the user 
    #and show the views edit format with the project details
    def edit
         @project = Project.find(params[:id])
    end
    
    #update method - references project Model(project.rb) and edit Views (edit.html.erb)
    #params[:id] passed as parameters
    #ie. a project is identified with an id number for example:../projects/1)
    #so it will find according to id number, the project selected by the user 
    #and show the Views edit format with the project details
    #if else statement to for 'save project' function to save updates to database
    #and redirect user to show page of that project
    ##or else re-render the current page, edit Views( render 'edit' )
    def update
         @project = Project.find(params[:id])
         
        if(@project.update(project_params))
            redirect_to @project
        else
            render 'edit' 
        end
    end
    
    #destroy method - references project Model(project.rb) and show Views (show.html.erb)
    #to get the project by id
    #and destroy that particular project and redirect to current page
    def destroy
         @project = Project.find(params[:id])
         @project.destroy

         redirect_to projects_path
    end
    
    #method project_params to allow only values: name, season, category
    #used as a parameter passed in the create method
    private def project_params
        params.require(:project).permit(:name, :season, :category)
    end
    
end
