class MissionsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :unproccesable_entity_inromation
    def create
        mission = Mission.create(permitted_params)
        render json: mission.planet, status: :created  
    end

    private

    def permitted_params
        params.permit(:name, :scientist_id, :planet_id)
    end
    def unproccesable_entity_inromation(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity

    end
end
