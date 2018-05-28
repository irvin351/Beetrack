module Api
    module V1
        class GpsController < ActionController::Base
        	def index
        		data = JSON.parse(request.body.read)
			end

			def create				
			end

			def show
			end

			private
			def gps_params
				params.require(:gps).permit :latitude, :longitude, :sent_at , :vehicle_identifier
			end
        end
    end
end