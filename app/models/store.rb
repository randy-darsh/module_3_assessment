class Station
  attr_reader :long_name, :city, :distance, :phone_number, :store_type

  def initialize(attributes = {})
    @attributes = attributes
    @long_name = attributes[:longName]
    @city = attributes[:city]
    @distance = attributes[:distance]
    @phone_number = attributes[:phone]
    @store_type = attributes[:storeType]
  end
end
