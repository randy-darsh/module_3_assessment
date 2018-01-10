require 'rails_helper'

describe 'Store' do
  it 'is valid with attributes' do
    store = Store.new(longName: "Store",
                      city: "Place",
                      distance: "10",
                      phone: "123-456-7890",
                      storeType: "Cool Store")

    expect(store).to have_attributes(longName: "Store",
                                     city: "Place",
                                     distance: "10",
                                     phone: "123-456-7890",
                                     storeType: "Cool Store")
  end
end
