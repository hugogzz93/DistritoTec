class EventsController < CrudController
	def new
		super
		@object.event_dates.build
	end
end
