class BestbuyService
  def initialize(filter = {})
    @filter = filter
  end

  def stores
    response = Faraday.get("https://api.bestbuy.com/v1/stores(postalCode=#{filter[:postalCode]})?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV["BESTBUY_KEY"]}")
    @stores = JSON.parse(response.body, symbolize_names: true)[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end

  private

  attr_reader :filter
end
