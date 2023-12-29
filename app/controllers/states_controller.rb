class StatesController < ApplicationController
    def index
        @states = State.all
        respond_to do |format|
          format.html
          format.json { render json: StateDatatable.new(params) }
        end
      end
     
      def show
        @state = State.find(params[:id])
      end
     
      def new
        @state = State.new
      end
     
      def edit
        @state = State.find(params[:id])
      end
     
      def create
        @state = State.new(state_params)
     
        if @state.save
          redirect_to @state
        else
          render 'new'
        end
      end
     
      def update
        @state = State.find(params[:id])
     
        if @state.update(state_params)
          redirect_to @state
        else
          render 'edit'
        end
      end
     
      def destroy
        @state = State.find(params[:id])
        @state.destroy
     
        redirect_to states_path
      end
     
      def fetch_states
        country = Country.find(params[:country_id])
        states = country.states
    
        render json: { states: states }
      end

      private
        def state_params
          params.require(:state).permit(:country_id, :name, :capital, :abbreviation, :is_active)
        end
end
