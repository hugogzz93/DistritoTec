class EventsController < CrudController
	def new
		super
		@object.event_dates.build
	end

	def show
		super
		@event_dates = @object.event_dates
	end

	def object_params
	  super.merge params.require(:event)
	                    .permit(event_dates_attributes: [:date])
	end
end
