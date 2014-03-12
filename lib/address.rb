class Address

  @@all_addresses = []

  def initialize(street, city, state)
    @street = street
    @city = city
    @state = state
  end

  def full_address
    @street + " " + @city + " " + @state
  end

  def street
    @street
  end

  def city
    @city
  end

  def state
    @state
  end

  def edit_address(street, city, state)
    @street = street
    @city = city
    @state = state
  end

  def Address.all
    @@all_addresses
  end

  def save
    @@all_addresses << self
  end

  def Address.create(street, city, state)
    new_address = Address.new(street, city, state)
    new_address.save
    new_address
  end
end
