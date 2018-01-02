class BestbuyService
  def initialize(filter = {})
    @filter = filter
  end

  def stores
    response = Faraday.get("")
    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations].map do |raw_store|
      Store.new(raw_store)
    end
  end

  private

  attr_reader :filter
end
