class ToDosController < ApplicationController
    def index
        @todos = ToDo.all
    end
    def new
    end
end
