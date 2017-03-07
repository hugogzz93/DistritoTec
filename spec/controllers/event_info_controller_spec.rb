require 'rails_helper'

RSpec.describe EventInfoController, type: :controller do
	let(:model) {:event_info}
	it_behaves_like 'a crud controller'
end
