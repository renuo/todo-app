class TodosController < ApplicationController
  add_breadcrumb "Todos&nbsp;".html_safe, :todos_path

  def index
    @todos = @current_user.todos
  end

  def show
    @todo = Todo.find(params[:id])
    add_breadcrumb "Description", :todo_path
  end

  def new
    @todo = Todo.new
    add_breadcrumb "Add Todo", :new_todo_path
  end

  def edit
    @todo = Todo.find(params[:id])
    add_breadcrumb "Edit Todo", :edit_todo_path
  end

  def create
    @todo = current_user.todos.new(todo_params)

    if @todo.save
      redirect_to @todo
    else
      render 'new'
    end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      redirect_to @todo
    else
      render 'edit'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to todos_path
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :description)
  end
end

