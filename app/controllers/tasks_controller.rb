class TasksController < ApplicationController

  def index
    @list = List.find(params[:list_id])
    @tasks = @list.tasks
  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    list = List.find(params[:list_id])
    @task = list.tasks.new(task_params)

    if @task.save
      flash[:notice] = "Task created successfully"
      redirect_to list_path(list)
      # redirect_to list_tasks_path
    else
      flash[:errors] = list.errors.full_messages.join(', ')
      render :new
    end
  end



      private

        def task_params
          params.require(:task).permit(:title,
                                       :notes,
                                       :status,
                                       :start_date,
                                       :due_date)
        end

end
