RSpec.shared_examples "a crud controller" do
	include Devise::Test::ControllerHelpers
	let(:klass) { model.to_s.camelcase.constantize }
	let(:klass_controller) { "#{model.to_s.capitalize.pluralize}Controller" }
	login_user


	it "should have a current_user" do
	  expect(subject.current_user).to_not eq(nil)
	end

	describe 'CRUD GET #index' do
		it_behaves_like 'a crud index'
	end

	describe 'CRUD GET #new' do
		it_behaves_like 'a crud new'
	end

	describe 'CRUD POST #create' do
		it_behaves_like 'a crud create'
	end

	describe 'CRUD GET #show' do
		it_behaves_like 'a crud show'
	end

	describe 'CRUD GET #edit' do
		it_behaves_like 'a crud edit'
	end

	describe 'CRUD PATCH #update' do
		it_behaves_like 'a crud update'
	end

	describe 'CRUD DELETE #destroy' do
		it_behaves_like 'a crud destroy'
	end
end