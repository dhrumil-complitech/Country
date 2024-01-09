class CountriesController < ApplicationController
    def index    
       @country = Country.all
        respond_to do |format|
          format.html
          format.json { render json: CountryDatatable.new(params, view_context: view_context) }
          format.csv { send_data Country.to_csv, filename: "countries-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"}
       end
    end
    
    def import_csv
      uploaded_file = params[:csv_file]
      if uploaded_file.present? && uploaded_file.content_type == 'text/csv'
        Country.import_from_csv(uploaded_file)
        flash[:success] = 'CSV file imported successfully.'
      else
        flash[:error] = 'Please upload a valid CSV file.'
      end
      redirect_to countries_path
    end
  
      def show
     
        @country = Country.find(params[:id])
      end
     
      def new
        @country = Country.new
      end
     
      def edit
        @country = Country.find(params[:id])
      end
     
      def create
        @country = Country.new(country_params)
     
        if @country.save
          redirect_to @country
        else
          render 'new'
        end
      end
     
      def update
        @country = Country.find(params[:id])
      
        if @country.update(country_params)
          redirect_to @country
        else
          render 'edit'
        end
      end
     
      def destroy
        @country = Country.find(params[:id])
        @country.destroy
     
        redirect_to countries_path
      end
            
      private
        def country_params
          params.require(:country).permit(:name, :code, :is_active)
        end
end
