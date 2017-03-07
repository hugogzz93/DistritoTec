require 'rails_helper'

RSpec.describe EventsController, type: :controller do
	let(:model) {:event}
	login_admin

	it "should have a current_user" do
	  expect(subject.current_user).to_not eq(nil)
	end

	describe 'GET #index' do
		before do
			@instances = FactoryGirl.create_list(:event, 3)
			get :index
			assert_response :success
		end
		
		it "should return all instances" do
			expect(assigns[:objects]).to eq(@instances)
		end

	end



end
