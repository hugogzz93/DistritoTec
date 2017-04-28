class EventRegistrationsController < CrudController

	def create
		params[:event_registration][:special_type] = params[:event_registration][:special_type].to_i
	  if model.create object_params
	    redirect_to event_date_path(id: params[:event_registration][:event_date_id])
	  else
	    render :new
	  end
	end

	def register
		user = User.find(params[:user_id])
		event = Event.find(params[:event_id])
		event_date = EventDate.find(params[:event_date_id])
		respond_to do |format|
			format.js {
				head event.register(user, event_date)? 201 : 400
			}
		end
	end

	def collection_path
		event_dates_path
	end
end
