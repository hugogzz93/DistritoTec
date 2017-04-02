require 'rails_helper'

RSpec.describe EventDate, type: :model do
  describe 'user uniqueness' do 
  	it 'should only allow user to register once'
  end

  describe 'prevent registrations of past dates' do 
  	it 'should prevent users to register to past dates'
  end
end
