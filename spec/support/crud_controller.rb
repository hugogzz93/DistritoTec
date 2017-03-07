RSpec.shared_examples "a crud controller" do |subject|
	include Devise::Test::ControllerHelpers
	let(:klass) { model.to_s.capitalize.constantize }
	let(:klass_controller) { "#{model.to_s.capitalize.pluralize}Controller" }
	login_user

	describe 'GET #index', type: :request do
		before do
			@instances = FactoryGirl.create_list(model, 3)
			get send("#{model.to_s.pluralize}_path")
			debugger
		end

		it "should find all instances" do 
			expect(klass).to receive(:all)
		end

		it "should return all instances" do
			expect(assigns[model.to_s.pluralize]).to eq(@instances)
		end

		# it should be_successful
	end

	# describe 'GET #new' do
	# 	before do 
	# 		get :new
	# 	end

	# 	it "should have blank instance" do
	# 		expect(assign[model.to_s]).to eq(FactoryGirl.build model)
	# 	end
	# end

	describe 'POST #create' do
	end

	describe 'GET #show' do
	end

	describe 'GET #edit' do
	end

	describe 'PATCH #update' do
	end

	describe 'DELETE #destroy' do
	end
end