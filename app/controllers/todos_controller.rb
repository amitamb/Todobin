class TodosController < ApplicationController

	before_filter :authenticate_user!

  # GET /todos
  # GET /todos.json
  def index
    @todos = current_user.todos.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = current_user.todos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
    @todo = current_user.todos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = current_user.todos.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = current_user.todos.build(params[:todo])
    
    TodoMailer.daily_todo_email(current_user).deliver

    respond_to do |format|
      if @todo.save
				format.js
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render json: @todo, status: :created, location: @todo }
      else
				format.js
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = current_user.todos.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy

    respond_to do |format|
			format.js
      format.html { redirect_to todos_url }
      format.json { head :ok }
    end
  end
  
  def complete
		@todo = current_user.todos.find(params[:id])
    @todo.update_attribute(:complete, true)

    respond_to do |format|
			format.js
      format.html { redirect_to todos_url }
      format.json { head :ok }
    end
  end

end
