class BestbuyService
  def initialize(filter = {})
    @filter = filter
  end

  def stores
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{filter[:location]},25))?format=json&show=storeType,longName,city,distance,phone&pageSize=17&apiKey=#{ENV["BESTBUY_KEY"]}")
    # response = Faraday.get("https://api.bestbuy.com/v1/stores(postalCode=#{filter[:postalCode]})?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV["BESTBUY_KEY"]}")
    @stores = JSON.parse(response.body, symbolize_names: true)[:stores].map do |raw_store|
      binding.pry
      Store.new(raw_store)
    end
  end

  private

  attr_reader :filter
end
