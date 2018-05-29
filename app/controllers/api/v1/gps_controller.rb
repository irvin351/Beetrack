module Api
    module V1
        class GpsController < ActionController::Base
        	def index
        		#gps = Gps.order('created_at DESC');
        		render status: :forbidden, text: "You do not have access to this page."
			end

			def create	
				@array = []
				if params[:_json]
					@params = params[:_json]
				else 
					@params = [params]
				end

					@params.each_with_index do |value,key|
					new_params = value.permit(:latitude, :longitude, :sent_at , :vehicle_identifier)	

					 new_params.permit(:gps).permitted?	
				      gps = Gps.new(new_params)

				      if gps.save
				      	@array.push({status: 'SUCCESS', message:'COORDENADAS GUARDADAS', data: gps },status: :ok)
					  else
					  	@array.push({status: 'ERROR', message:'COORDENADAS NO GUARDADAS', data: gps.erros },status: :unprocessable_entity)
					  end	

				    end
				
				render json: @array
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