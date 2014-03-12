class Contact

  @@all_contacts = []

  def initialize(firstname, lastname)
    @firstname = firstname
    @lastname = lastname
    @phones = []
    @emails = []
    @addresses = []
  end

  def Contact.all
    @@all_contacts
  end

  def save
    @@all_contacts << self
  end

  def Contact.create(firstname, lastname)
    new_contact = Contact.new(firstname, lastname)
    new_contact.fullname
    new_contact.save
    new_contact
  end

  def emails
    @emails
  end

  def phones
    @phones
  end

  def addresses
    @addresses
  end

  def final_name
    @fullname
  end

  def fullname
    @fullname = "#{@firstname} #{@lastname}"
    @firstname + " " + @lastname
  end


  def add_phone(phone_input)
    @phones << phone_input
  end

  def add_address(address)
    @addresses << address
  end

   def add_email(email)
    @emails <<  email
  end

end
