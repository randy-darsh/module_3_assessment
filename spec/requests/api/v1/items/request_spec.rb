require 'rails_helper'

describe 'User visits /api/v1/items' do
  before :each do
    create_list(:item, 5)
  end

  it 'they recieve a 200 JSON response containing all items' do
    get '/api/v1/items'

    expect(response.status).to eq(200)
    items = JSON.parse(response.body)
    expect(items.count).to eq(5)
    # When I send a GET request to `/api/v1/items`
    # I receive a 200 JSON response containing all items
    # And each item has an id, name, description, and image_url but not the created_at or updated_at
  end

  it 'they visit item show JSON page' do
    get '/api/v1/items/1'

    expect(response.status).to eq(200)
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(1)
    expect(item["name"]).to eq("Item 9")
    expect(item["description"]).to eq("Dead dove. Do not eat.")
    expect(item["image_url"]).to eq("http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200")
    # When I send a GET request to `/api/v1/items/1`
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  end

  it '' do
    delete '/api/v1/items/1'

    expect(response.status).to eq(204)
    # When I send a DELETE request to `/api/v1/items/1`
    # I receive a 204 JSON response if the record is successfully deleted
  end
end
