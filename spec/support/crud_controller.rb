RSpec.shared_examples "a crud controller" do
	include Devise::Test::ControllerHelpers
	let(:klass) { model.to_s.capitalize.constantize }
	let(:klass_controller) { "#{model.to_s.capitalize.pluralize}Controller" }
	login_user


	it "should have a current_user" do
	  expect(subject.current_user).to_not eq(nil)
	end

	describe 'GET #index' do
		before do
			@instances = FactoryGirl.create_list(model, 3)
			get :index
			assert_response :success
		end
		
		it "should return all instances" do
			expect(assigns[:objects]).to eq(@instances)
		end
	end

	# describe 'GET #new' do
	# 	before do 
	# 		get :new
	# 	end

	# 	it "should have blank instance" do
	# 		expect(assign[model.to_s]).to eq(FactoryGirl.build model)
	# 	end
	# end

	# describe 'POST #create' do
	# end

	# describe 'GET #show' do
	# end

	# describe 'GET #edit' do
	# end

	# describe 'PATCH #update' do
	# end

	# describe 'DELETE #destroy' do
	# end
end