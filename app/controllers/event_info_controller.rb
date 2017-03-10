class EventInfoController < CrudController
	def index
		@objects = model.where event_id: params[:event_id]
	end

	def new
		@object = Event.find(params[:event_id]).event_info.build
	end

	def create
		@object = model.new object_params
		@object.event_id = params[:event_id]
		if @object.save
			redirect_to collection_path
		else
			render :new
		end
	end
end
