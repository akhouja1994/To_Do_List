class ToDosController < ApplicationController
    before_action :set_todo, only: [:show, :edit, :update, :destroy]
    def index
        @todos = current_user.to_dos
    end
    def new
        @todo = current_user.to_dos.new
    end
    def create
        @todo=current_user.to_dos.new(todo_params)

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
        @todo = current_user.to_dos.find(params[:id])
      end
    def show
        @todo = current_user.to_dos.find(params[:id])
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
        @todo = current_user.to_dos.find(params[:id])
      end

end
