require 'rails_helper'

RSpec.describe EventsController, type: :controller do
	let(:model) {:event}
	it_behaves_like 'a crud controller'
end
