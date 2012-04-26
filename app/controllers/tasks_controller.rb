class TasksController < ApplicationController
  
  before_filter :require_user, :current_user

  def index
    @tasks = @current_user.tasks
  end

  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  def new
    @task = Task.new
    @tasks = @current_user.tasks
  end

  def edit
    @task = Task.find(params[:id])
    @tasks = @current_user.tasks.where("id != ?", @task.id)
  end

  def create
    @task = @current_user.tasks.new(params[:task])

    respond_to do |format|
      if @task.save
        params[:task_ids].each do |prereq|
          @task.prerequisites.create(:prereq, prereq)
        end
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.prerequisites = params[:task_ids]

    respond_to do |format|
      if @task.update_attributes(params[:task])
        params[:task][:task_ids].each do |prereq|
          @task.prerequisites.create(:prereq, prereq)
        end
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
    end
  end
end
