class TasksController < ApplicationController
    
    #create method - project Model(project.rb) and show Views (show.html.erb)
    #finds the project instance based on project id params
    #and assigns the new task (created based on task_params) to the project id
    #then redirects to show project Views
    def create
        @project = Project.find(params[:project_id])
        @task = @project.tasks.create(task_params)
        redirect_to project_path(@project)
    end
    
    #destroy method - project Views (project.rb) and show Views (show.html.erb)
    #responsible for finding the project instance based on project id params
    #and assigns the project to the task instance based on id params
    #and deletes the task, then redirects to show Views
    def destroy
        @project = Project.find(params[:project_id])
	    @task = @project.tasks.find(params[:id])
	    @task.destroy
	    redirect_to project_path(@project)
    end
    
    #task_params method - pass as a parameter (private)
    #only allow a list of trusted parameters through
    private def task_params
        params.require(:task).permit(:boxqty, :created, :deliveryslot)
    end
end



