require 'rails_helper'

describe 'User visits /api/v1/items' do
  before :each do
    create_list(:item, 5)
  end

  it 'they recieve a 200 JSON response containing all items' do
    get :index

    expect(response).to be_success

    items = JSON.parse(response.body)
    expect(items.count).to eq(5)
  end
end

# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
