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
    @todo = Todo.new
    add_breadcrumb "Add Todo", :new_todo_path
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo
    else
      render 'new'
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :description)
  end
end

