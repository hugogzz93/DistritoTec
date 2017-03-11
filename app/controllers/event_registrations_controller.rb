class EventRegistrationsController < CrudController
	def register
		user = User.find(params[:user_id])
		event = Event.find(params[:event_id])
		respond_to do |format|
			format.js {
				head event.register(user)? 201 : 400
			}
		end
	end
end
