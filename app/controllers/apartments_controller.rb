class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    
    def index
        apartments = Apartment.all
        render json: apartments, status: :ok
    end

    def show
        apartment = apartment_id
        render json: apartment, status: :ok
    end

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :accepted
    end

    def destroy
        apartment = apartment_id
        apartment.destroy
    end

    private

    def apartment_id
        Apartment.find(params[:id])
    end

    def apartment_params
        params.permit(:number)
    end

    def render_unprocessable_entity(invalid)
        render json:{error: invalid.record.errors}, status: :unprocessable_entity
    end

end
