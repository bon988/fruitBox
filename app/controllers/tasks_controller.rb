class TasksController < ApplicationController
    #http authentication - validation
    #to authenticate on all the routes, to allow users to read project and create task but not destroy
    http_basic_authenticate_with name: "nci", password: "1234", only: [:destroy]
    
    #create method for creating a task
    def create
        @project = Project.find(params[:project_id])
        @task = @project.tasks.create(task_params)
        redirect_to project_path(@project)
    end
    
    #destroy method - for the tasks delete function '[x]'
    def destroy
        @project = Project.find(params[:project_id])
	    @task = @project.tasks.find(params[:id])
	    @task.destroy
	    redirect_to project_path(@project)
    end
    
    #task_params method, passed as parameters in the create method
    private def task_params
        params.require(:task).permit(:boxqty, :created, :deliveryslot)
    end
end



