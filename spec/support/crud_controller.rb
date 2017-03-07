RSpec.shared_examples "a crud controller" do
	include Devise::Test::ControllerHelpers
	let(:klass) { model.to_s.camelcase.constantize }
	let(:klass_controller) { "#{model.to_s.capitalize.pluralize}Controller" }
	login_user


	it "should have a current_user" do
	  expect(subject.current_user).to_not eq(nil)
	end

	describe 'CRUD GET #index' do
		before do
			FactoryGirl.create_list(model, 3)
			@instances = klass.all
			get :index
			assert_response :success
		end
		
		it "should return all instances" do
			expect(assigns[:objects]).to eq(@instances)
		end
	end

	describe 'CRUD GET #new' do
		it "should have blank instance" do
			expect(klass).to receive(:new)
			get :new
		end
	end

	describe 'CRUD POST #create' do
		before do 
			@params = FactoryGirl.attributes_for :event
		end

		it "should create the object" do 
			expect(klass).to receive(:create).and_return(:true)
			post :create, params: { model => @params}
		end
	end

	describe 'CRUD GET #show' do
		before do 
			@instance = FactoryGirl.create model
			get :show, params: { id: @instance.id }
		end

		it "should return the seeked object" do
			expect(assigns[:object]).to eq(@instance)
		end
	end

	describe 'CRUD GET #edit' do
		before do 
			@instance = FactoryGirl.create model
			get :edit, params: { id: @instance.id }
		end

		it "should return the seeked object" do
			expect(assigns[:object]).to eq(@instance)
		end
	end

	describe 'CRUD PATCH #update' do
		before do 
			@instance = FactoryGirl.create model
			@updates = FactoryGirl.attributes_for model
			patch :update, params: { id: @instance.id, model => @updates }
			@instance.reload
		end

		it "should update the object" do
			matching = @instance.attributes.transform_keys {|x| x.to_sym}.to_a & 
								 @updates.to_a
			expect(matching).to eq(@updates.to_a)
		end

	end

	describe 'CRUD DELETE #destroy' do
		before do 
			@instance = FactoryGirl.create model
			delete :destroy, params: { id: @instance.id }
		end

		it "should destroy the object" do
			expect(klass.exists? @instance).to be(false)
		end
	end
end