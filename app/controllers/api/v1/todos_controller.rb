module Api
    module V1
        class TodosController < ApplicationController
            def index
                todos = Todo.order(created_at: :desc)
                render json: { status: 'SUCCESS', message: 'Loaded posts', data: todos }
            end

            def show
                @todo = Todo.find(params[:id])
                render json: { status: 'SUCCESS', message: 'Loaded the post', data: @todo }
            end

            def create
                todo = Todo.new(todo_params)
                if todo.save
                  render json: { status: 'SUCCESS', data: todo }
                else
                  render json: { status: 'ERROR', data: todo.errors }
                end
            end

            def update
                @todo = Todo.find(params[:id])
                if @todo.update(todo_params)
                  render json: { status: 'SUCCESS', message: 'Updated the post', data: @todo }
                else
                  render json: { status: 'SUCCESS', message: 'Not updated', data: @todo.errors }
                end
            end

            def destroy
                @todo = Todo.find(params[:id])
                @todo.destroy
                render json: { status: 'SUCCESS', message: 'Deleted the post', data: @todo }
            end

            def todo_params
                params.require(:todo).permit(:id,:body,:title,:created_at,:updated_at)
            end
        end
    end
end
