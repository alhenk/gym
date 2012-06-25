class StaticController < ApplicationController

    def index
      @allpushups = Pushup.all
    end
    
    def show
      redirect_to static_index
    end
end
