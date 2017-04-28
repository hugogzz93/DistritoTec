class EventsController < CrudController
	before_action :permit_if_admin, except: [:show, :index]
	
	def new
		super
		@object.event_dates.build
	end

	def show
		super
		@event_info = @object.event_info
		@event_dates = @object.event_dates
	end

	def object_params
	  super.merge params.require(:event)
	                    .permit(:avatar, :decsription, event_dates_attributes: [:date])
	end
end
