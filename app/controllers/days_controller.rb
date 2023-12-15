class DaysController < ApplicationController
  before_action :authenticate_user!
    def index
        @days = Day.all
    end
    
    def new
        @day = Day.new
      end
    
      def create
        day = Day.new(day_params)

        day.user_id = current_user.id
        if day.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @day = Day.find(params[:id])
        @comments = @day.comments
        @comment = Comment.new
      end
    
      def edit
        @day = Day.find(params[:id])
      end

      def update
        day = Day.find(params[:id])
        if day.update(day_params)
          redirect_to :action => "show", :id => day.id
        else
          redirect_to :action => "new"
        end
      end
      
      def destroy
        day = Day.find(params[:id])
        day.destroy
        redirect_to action: :index
      end
    
      private
      def day_params
        params.require(:day).permit(:body, :start_time, :image)
      end
    end
