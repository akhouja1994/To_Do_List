class ToDosController < ApplicationController
    before_action :set_todo, only: [:show, :edit, :update, :destroy]
    def index
        @todos = ToDo.all
    end
    def new
        @todo = ToDo.new
    end
    def create
        @todo=ToDo.new(todo_params)

        respond_to do |format|
            if @todo.save
              format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
              format.json { render :show, status: :created, location: @todo }
            else
              format.html { render :new }
              format.json { render json: @todo.errors, status: :unprocessable_entity }
            end
        end
    end
    def destroy
        @todo.destroy
        respond_to do |format|
          format.html { redirect_to to_dos_path, notice: 'Todo was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    def todo_params
        params.require(:to_do).permit(:name, :due)
    end
    def set_todo
        @todo = ToDo.find(params[:id])
      end
    def show
        @todo = ToDo.find(params[:id])
    end
    def update
        respond_to do |format|
          if @todo.update(todo_params)
            format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
            format.json { render :show, status: :ok, location: @todo }
          else
            format.html { render :edit }
            format.json { render json: @todo.errors, status: :unprocessable_entity }
          end
        end
      end
      def edit
        @todo = ToDo.find(params[:id])
      end

end
