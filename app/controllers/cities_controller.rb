class CitiesController < ApplicationController
    def index
        @cities = City.all
        respond_to do |format|
          format.html
          format.json { render json: CityDatatable.new(params, view_context: view_context) }
          format.csv { send_data City.to_csv, filename: "cities-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"}
        end
      end
     
      def show
        @city = City.find(params[:id])
      end
     
      def new
        @city = City.new
      
      end
     
      def edit
        @city = City.find(params[:id])
      end
     
      def create
        @city = City.new(city_params)
     
        if @city.save
          redirect_to @city
        else
          render 'new'
        end
      end
     
      def update
        @city = City.find(params[:id])
     
        if @city.update(city_params)
          redirect_to @city
        else
          render 'edit'
        end
      end
     
      def destroy
        @city = City.find(params[:id])
        @city.destroy
     
        redirect_to cities_path
      end
     
      private
        def city_params
          params.require(:city).permit(:country_id, :state_id, :name, :zip, :population)
        end
        def states_by_country 
          @states = State.where(country_id: params[:country_id]) 
          render partial: 'states_dropdown', locals: { states: @states } 
        end
end
