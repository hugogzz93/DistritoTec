require 'rails_helper'

RSpec.describe Event, type: :model do

	subject { create :event }

	describe '#register' do 
		context "When there are no event dates" do 
			xit "should raise an error" do 
			end

			xit "should not create the registration" do 
			end
		end

		context "When there is an event date" do 
			context "and the user hasn't registered" do 
				xit "should create the registration" do 
				end

				xit "should be for the next date" do 
				end

				xit "should have the correct user" do 
				end

				xit "should have the correct event" do 
				end
			end

			context "and the user has already registered" do 
				xit "should not raise an error" do 
				end

				xit "should not create a new registration" do 
				end

				xit "should not affect the previous registration" do 
				end
			end
		end
	end
end
