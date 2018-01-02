class Store
  attr_reader :longName, :city, :distance, :phone, :storeType

  def initialize(attributes = {})
    @attributes = attributes
    @longName = attributes[:longName]
    @city = attributes[:city]
    @distance = attributes[:distance]
    @phone = attributes[:phone]
    @storeType = attributes[:storeType]
  end

   def self.filter_by_zip(zip)
    stores = BestbuyService.stores_by_zip(zip)
    stores[:stores].map do |store|
      Store.new(store)
    end
  end
end
