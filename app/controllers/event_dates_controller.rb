class EventDatesController < CrudController

	def index
		super
		@parent = Event.find params[:event_id]
	end

	def new
		super
		@parent = Event.find params[:event_id]
	end

	def show
		super
		@users = @object.users
	end

	def collection_path
		events_path
	end
end
