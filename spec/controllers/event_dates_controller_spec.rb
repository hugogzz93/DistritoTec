require 'rails_helper'

RSpec.describe EventDatesController, type: :controller do
	let(:model) {:event_date}
	it_behaves_like 'a crud controller'
end
