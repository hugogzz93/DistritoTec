require 'rails_helper'

RSpec.describe EventInfoController, type: :controller do
	include Devise::Test::ControllerHelpers
	let(:model) { :event_info }
	let(:klass) { model.to_s.camelcase.constantize }
	let(:klass_controller) { "#{model.to_s.capitalize.pluralize}Controller" }
	let(:event) { FactoryGirl.create(:event) }
	let(:event_info) { FactoryGirl.create(model, event_id: event.id) }
	login_user


	it "should have a current_user" do
	  expect(subject.current_user).to_not eq(nil)
	end

	describe 'GET #index' do
		before do
		  FactoryGirl.create_list(model, 3)
		  2.times {FactoryGirl.create model, event: event }
		  @instances = klass.where event: event
		  get :index, params: { event_id: event.id }
		  assert_response :success
		end
		
		it "should return all info instances for provided event" do
		  expect(assigns[:objects]).to match_array(@instances)
		end
	end

	describe 'GET #new' do
		before do 
			get :new, params: { event_id: event.id }
			assert_response :success
		end
		it "should have the parent's id" do
			expect(assigns[:object].event_id).to eq(event.id)
		end
	end

	describe 'POST #create' do
		before do
			@params = FactoryGirl.attributes_for model
			post :create, params: { event_info: @params,
															event_id: event.id}
			@object = klass.find_by @params
		end

		it "should create the appropriate values" do 
			expect(@object).to be_truthy
		end

		it "should have the correct parent" do 
			expect(@object.event_id).to eq(event.id)
		end
	end

	describe 'GET #show' do
		it "should show the correct object" do 
			get :show, params: { id: event_info.id, event_id: event.id }
			assert_response :success
			expect(assigns[:object].id).to eq(event_info.id)
		end

	end

	describe 'GET #edit' do
		before do 
			get :edit, params: { id: event_info.id, event_id: event.id }
			assert_response :success
		end

		it "should get the correct object" do 
			expect(assigns[:object].id).to eq(event_info.id)
		end
	end

	describe 'PATCH #update' do
		before do 
			@updates = FactoryGirl.attributes_for model
			patch :update, params: { id: event_info.id,
															 event_id: event.id,
															 event_info: @updates }
			event_info.reload
		end

		it "should update the attributes" do 
			equality = true
			@updates.each do |key, val|
				equal = false unless event_info[key] == val
			end
			expect(equality).to be(true)
		end
	end

	describe 'DELETE #destroy' do
		before do 
			@instance = FactoryGirl.create model
			delete :destroy, params: { id: @instance.id, event_id: event.id}
		end

		it "should destroy the object" do
			expect(klass.exists? @instance).to be(false)
		end
	end


end
