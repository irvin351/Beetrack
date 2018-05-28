module Api
    module V1
        class GpsController < ActionController::Base
        	def index
        		gps = Gps.order('created_at DESC');
        		render json: {status: 'SUCCESS', message:'Coordenadas Cargadas', data: gps},status: :ok
			end

			def create	
				gps = Gps.new(gps_params)
				if gps.save
					render json: {status: 'SUCCESS', message:'Coordenadas Guardadas', data:gps},status: :ok
				else
					render json: {status: 'ERROR', message:'Coordenadas no Guardadas', data:gps.erros},status: :unprocessable_entity
				end			
			end

			def show
			end

			private

			def gps_params
			  params.permit(:latitude, :longitude, :sent_at , :vehicle_identifier)
			end
			
        end
    end
end