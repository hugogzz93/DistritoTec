require 'rails_helper'

RSpec.describe Event, type: :model do

	subject { FactoryGirl.create :event }

	describe '#register' do 
		context "When there are no event dates" do 
			xit "should return false" do 
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
				xit "should return false" do 
				end

				xit "should not create a new registration" do 
				end

				xit "should not affect the previous registration" do 
				end
			end
		end
	end

	describe '#create_date' do 
		it "should create a new event date" do 
			expect(EventDate).to receive(:new).at_least(:once).and_call_original
			subject.create_date
		end

		it "should have the correct event id" do 
			subject.create_date
			expect(EventDate.last.event_id).to eq(subject.id)

		end
	end

	describe '#next_event_date' do
		before do
			subject.event_dates.destroy_all
			2.times { FactoryGirl.create :event_date, event: subject, date: Time.zone.now - 1.day }
			2.times { FactoryGirl.create :event_date, event: subject, date: Time.zone.now + 2.days }
			@next_most_recent = FactoryGirl.create :event_date,
																						 event: subject,
																						 date: Time.zone.now + 1.day
		end

		it "should return the closes next date" do 
			expect(subject.next_event_date).to eq(@next_most_recent)
		end

	end
end
