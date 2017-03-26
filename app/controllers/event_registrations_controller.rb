class EventRegistrationsController < CrudController
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
end
