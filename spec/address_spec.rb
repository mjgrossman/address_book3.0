require 'rspec'
require 'contact'
require 'address'
require 'email'
require 'phone'

describe Contact do
  it 'initializes a new contact with name' do
    test_contact = Contact.new("Bob", "Biggs")
    test_contact.should be_an_instance_of Contact
    test_contact.fullname.should eq "Bob Biggs"
  end
  it "adds contact's phone number to phones array"  do
    test_contact = Contact.new("Bob", "Biggs")
    # test_phone = Phone.new(1234567890)
    test_contact.add_phone(5)
    test_contact.phones.should eq [5]
  end
    it "adds contact's address to address array"  do
    test_contact = Contact.new("Bob", "Biggs")
    # test_phone = Phone.new(1234567890)
    test_contact.add_address("123 NW Elm St.")
    test_contact.addresses.should eq ["123 NW Elm St."]
  end
  describe '.create' do
    it 'creates an instance of the class and saves it to the class array' do
      test_contact = Contact.create("Bob", "Biggs")
      Contact.all.should eq [test_contact]
    end
  end
  # describe '.all_names' do
  #   it 'returns all contact names' do
  #   test_contact = Contact.create("Bob", "Biggs")
  #   Contact.all_names.should eq "Bob Biggs"
  #   end
  # end
end
