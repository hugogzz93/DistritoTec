require 'rails_helper'

RSpec.describe EventDatesController, type: :controller do
	let(:model) {:event_date}
	let(:klass) { model.to_s.camelcase.constantize }
	let(:klass_controller) { "#{model.to_s.capitalize.pluralize}Controller" }
	let(:event) { FactoryGirl.create(:event) }
	let(:event_date)  { FactoryGirl.create(:event_date, event_id: event.id) }
	login_admin


	it "should have a current_user" do
	  expect(subject.current_user).to_not eq(nil)
	end

	it "should be an administrator" do
		# subject.current_user.admin!
		expect(subject.current_user.admin?).to be_true
	end

	# describe 'CRUD GET #index' do
	# 	before do
	# 	  FactoryGirl.create_list(model, 3)
	# 	  2.times {FactoryGirl.create model, event: event }
	# 	  @instances = klass.where event: event
	# 	  get :index, params: { event_id: event.id }
	# 	  assert_response :success
	# 	end
		
	# 	it "should return all date instances for provided event" do
	# 	  expect(assigns[:objects]).to match_array(@instances)
	# 	end
	# end

	# describe 'CRUD GET #new' do
	# 	before do 
	# 		get :new, params: { event_id: event.id }
	# 		assert_response :success
	# 	end
		
	# 	it "should have the parent's id" do
	# 		expect(assigns[:object].event_id).to eq(event.id)
	# 	end
	# end

	describe 'CRUD POST #create' do
		before do
			@params = FactoryGirl.attributes_for model, event_id: event.id
			post :create, params: { event_date: @params }
			@object = klass.last
		end

		it "should create the appropriate values" do 
			expect(@object.date.to_i).to be_within(0.0000000001).of(@params[:date].to_i)
		end

		it "should have the correct parent" do 
			expect(@object.event_id).to eq(@params[:event_id])
		end
	end

	describe 'CRUD GET #show' do

		before do
			FactoryGirl.create_list(:event_registration, 3)
		  3.times { FactoryGirl.create :event_registration, event_date: event_date }
		  @users = User.where(event_dates: {id: EventDate.first.id})
		  						 .joins(event_registrations: :event_date)
			get :show, params: { id: event_date.id }
			assert_response :success
		end

		it "should show the correct date" do 
			expect(assigns[:object].id).to eq(event_date.id)
		end

		it "should show the registered users" do 
			expect(assigns[:users]).to match_array(@users)
		end


	end

	# describe 'CRUD GET #edit' do
	# 	before do 
	# 		get :edit, params: { id: event_date.id, event_id: event.id }
	# 		assert_response :success
	# 	end

	# 	it "should get the correct object" do 
	# 		expect(assigns[:object].id).to eq(event_info.id)
	# 	end
	# end

	# describe 'CRUD PATCH #update' do
	# 	before do 
	# 	  @instance = FactoryGirl.create model
	# 	  @updates = FactoryGirl.attributes_for model, 
	# 	  					 date: Time.zone.now.beginning_of_day
	# 	  patch :update, params: { id: @instance.id, model => @updates }
	# 	             @updates.to_a
 #      @instance.reload
	# 	end

	# 	it "should update the object" do
	# 	  expect(@instance.date).to eq(@updates[:date])
	# 	end
	# end

	describe 'CRUD DELETE #destroy' do
		before do 
			@instance = FactoryGirl.create model
			delete :destroy, params: { id: @instance.id, event_id: event.id}
		end

		it "should destroy the object" do
			expect(klass.exists? @instance).to be(false)
		end
	end
end
