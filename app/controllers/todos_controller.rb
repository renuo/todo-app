class TodosController < ApplicationController
  add_breadcrumb "Home&nbsp;".html_safe, :todos_path

  def index
    @todo = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
    add_breadcrumb "Description", :todo_path
  end

  def new
    add_breadcrumb "Add Todo", :new_todo_path
  end

  def create
    @todo = Todo.new(todo_params)

    @todo.save
    redirect_to @todo
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :description)
  end
end

