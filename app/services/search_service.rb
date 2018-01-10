class SearchService
  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

  def best_buy_service
    @best_buy_service ||= BestBuyService.new
  end

  def stores
    best_buy_service.stores_by_zip(zip)[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end

  def store_count
    best_buy_service.stores_by_zip(zip)[:total]
  end

end
