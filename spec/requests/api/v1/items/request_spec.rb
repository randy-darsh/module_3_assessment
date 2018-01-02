require 'rails_helper'

describe 'User visits /api/v1/items' do

  it 'they recieve a 200 JSON response containing all items' do
    create_list(:item, 5)
    get '/api/v1/items'

    expect(response.status).to eq(200)
    items = JSON.parse(response.body)
    expect(items.count).to eq(5)
    # When I send a GET request to `/api/v1/items`
    # I receive a 200 JSON response containing all items
    # And each item has an id, name, description, and image_url but not the created_at or updated_at
  end

  it 'they visit item show JSON page' do
    create_list(:item, 5)
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

  it 'they send a delete request and the object is deleted' do
    create_list(:item, 5)
    delete '/api/v1/items/1'

    expect(response.status).to eq(204)
    # When I send a DELETE request to `/api/v1/items/1`
    # I receive a 204 JSON response if the record is successfully deleted
  end

  # it 'they can create a JSON object with a post request' do
  #   item = create(:item)
  #   post '/api/v1/items', params: { item: item }

  #   expect(response.status).to eq(201)

  #   parsed_response = JSON.parse(response.body)
  #   # When I send a POST request to `/api/v1/items` with a name, description, and image_url
  #   # I receive a 201 JSON  response if the record is successfully created
  #   # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  # end
end
