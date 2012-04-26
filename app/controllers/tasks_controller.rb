class TasksController < ApplicationController
  
  before_filter :require_user, :current_user

  def index
    @tasks = @current_user.tasks
  end
  
  def new
    @task = Task.new
    @tasks = @current_user.tasks
  end
  
  def new_state
    @task = Task.find(params[:id])
    new_state = case @task.current_state
    when 'Not Yet Started'
      'Started'
    when 'Started'
      'Completed'
    end
    @task.update_attribute(:current_state, new_state)
    redirect_to tasks_path
  end
  
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  def edit
    @task = Task.find(params[:id])
    @tasks = @current_user.tasks.where("id != ?", @task.id)
  end

  def create
    @task = @current_user.tasks.new(params[:task])
    @task.current_state = "Not Yet Started"
    @task.prereqs = params[:task_ids]
    
    respond_to do |format|
      if @task.save
        
        params[:task_ids].each do |prereq|
          @task.prerequisites.create(:prereq => prereq)
        end unless params[:task_ids].nil?
        
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    # if params[:task_ids].nil? && @task.prerequisites > 0
    #   @task.remove_prerequisites
    # else
    #   @task.prerequisites = params[:task_ids]
    # end
    
    if params[:task_ids].nil? 
      @task.prereqs = nil 
    else
      @task.prereqs = params[:task_ids]
    end

    respond_to do |format|
      if @task.update_attributes(params[:task])
        # params[:task][:task_ids].each do |prereq|
        #           @task.prerequisites.create(:prereq, prereq)
        #         end
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
