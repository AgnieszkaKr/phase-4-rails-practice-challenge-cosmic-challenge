class ScientistsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid , with: :unproccesable_entity
    def index
        render json: Scientist.all
    end

    def show
        scientist = Scientist.find(params[:id])
        render json: scientist, serializer: ScientistMissionSerializer
    end

    def create
        scientist = Scientist.create!(permitted_params)
        render json: scientist, status: :created
    end

    def update
        updated_scientist = Scientist.update!(permitted_params)
        render json: updated_scientist, status: :accepted
    end

    def destroy 
        scientist = Scientist.find(params[:id])
        scientist.destroy
        head :no_content
    end
    private
    def permitted_params
        params.permit(:name, :field_of_study, :avatar)
    end   
        
    def not_found
        render json: {error: "Scientist not found"}, status: :not_found
    end

    def unproccesable_entity(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    
end
