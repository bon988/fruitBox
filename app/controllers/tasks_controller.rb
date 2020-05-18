class TasksController < ApplicationController
    #create method -references project model(project.rb) and show views (show.html.erb)
    #finds the project by id
    #and assigns the new task to the project id
    #and saves the task values (task_params) from user
    #then redirects to views show 
    def create
        @project = Project.find(params[:project_id])
        @task = @project.tasks.create(task_params)
        redirect_to project_path(@project)
    end
    
    #destroy method - references project views (project.rb) and show views  (show.html.erb)
    #to find the project by id
    #and find the task by id
    #and destroy that particular task and then redirect 
    #for the tasks 'delete' function '[x]'
    def destroy
        @project = Project.find(params[:project_id])
	    @task = @project.tasks.find(params[:id])
	    @task.destroy
	    redirect_to project_path(@project)
    end
    
    #task_params method (private, passed as a parameter)
    #to permit only specified values (boxqty, created, deliveryslot) for a task
    private def task_params
        params.require(:task).permit(:boxqty, :created, :deliveryslot)
    end
end



