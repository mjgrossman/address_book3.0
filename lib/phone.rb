class Phone

  @@all_phones = []

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def phone_edit(phone_number)
    @phone_number = phone_number
  end

  def phone_number
    @phone_number
  end

  def Phone.all
    @@all_phones
  end

  def save
    @@all_phones << self
  end

  def Phone.create(phone_number)
    new_phone_number = Phone.new(phone_number)
    new_phone_number.save
    new_phone_number
  end

end
