require 'rails_helper'

RSpec.describe Event, type: :model do

	subject { FactoryGirl.create :event }

	def registration(user)
		subject.event_registrations.where(user_id: user.id).first
	end

	describe '#register' do 
		before :each do 
			@user = FactoryGirl.create :user
			@next_event = FactoryGirl.create :event_date,
																			  event: subject,
																			  date: Time.zone.now + 1.day
		end

		context "When there are no event dates" do 
			before do 
				subject.event_dates.destroy_all
				EventRegistration.destroy_all
			end

			it "should return false" do 
				expect(subject.register @user).to be_falsey
			end

			it "should not create the registration" do 
				expect(EventRegistration.all.count).to eq(0)
				expect(subject.event_registrations.where(user_id: @user.id).any?)
							.to be_falsey
			end
		end

		context "When there is an event date" do 
			context "and the user hasn't registered" do 
				before do 
					subject.register @user
				end
				it "should create the registration" do 
					expect(subject.event_registrations.where(user_id: @user.id).any?)
								 .to be
				end

				it "should be for the next date" do 
					expect(registration(@user).event_date).to eq(@next_event)
				end

				it "should have the correct user" do 
					expect(subject.event_registrations.last.user).to eq(@user)
				end

				it "should have the correct event" do 
					expect(EventRegistration.last.event).to eq(subject)
				end
			end

			context "and the user has already registered" do 
				before do 
					subject.register @user
				end

				it "should return false" do
					expect(subject.register @user).to be_falsey
				end

				it "should not create a new registration" do
					expect(@next_event.event_registrations.where(user_id: @user.id).count)
								.to eq(1)
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

		it "should return the closest next date" do 
			expect(subject.next_event_date).to eq(@next_most_recent)
		end

	end
end
