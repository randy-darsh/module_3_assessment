class BestbuyService

  def self.stores_by_zip(zip)
    @stores = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,distance,phone&pageSize=17&apiKey=#{ENV["BESTBUY_KEY"]}")
    response = JSON.parse(@stores.body, symbolize_names: true)
  end

end
