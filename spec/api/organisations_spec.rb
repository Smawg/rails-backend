require 'spec_helper'

describe "Organisations API", :type=> :api do
  it 'retrieves all organisations' do
    get "/api/v1/org/"
    expect(response).to be_success
    expect(json.length).to eq(0)
  end
end
