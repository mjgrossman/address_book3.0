require './lib/contact'
require './lib/address'
require './lib/email'
require './lib/phone'

@current_contact

def contact_create
  puts "Please enter a contact first name"
  input_firstname = gets.chomp
  puts "Please enter a contact last name"
  input_lastname = gets.chomp
  @new_contact = Contact.create(input_firstname, input_lastname)
  @current_contact = @new_contact
  main_menu
end

def main_menu
  puts "\nADD MENU"
  puts "========"
  puts @current_contact.fullname
  puts "\nPress 'a' to add an address, 'p' to add a phone number"
  puts "Press 'e' to add an email"
  puts "Press 'c' to add another contact"
  puts "Press 'l' to go to the list menu to list things"
  user_choice = gets.chomp

  case user_choice

  when 'a'
    add_address
  when 'p'
    add_phone
  when 'e'
    add_email
  when 'c'
    contact_create
  when 'l'
    list_menu
  else
    puts "Sorry, invalid option"
    main_menu
  end
end

def add_address
  puts "What is your street?"
  street_input = gets.chomp
  puts "What is your city?"
  city_input = gets.chomp
  puts "What is your state?"
  state_input = gets.chomp

  new_address = Address.create(street_input, city_input, state_input)
  @current_contact.add_address(new_address)
  puts "Address added."
  puts "Add an additional address? y or n"
  user_choice = gets.chomp
  if user_choice == 'y'
    add_address
  else
    main_menu
  end
end

def add_email
  puts "What is your email address?"
  email_input = gets.chomp

  new_email = Email.create(email_input)
  @current_contact.add_email(new_email)
  puts "Email added!"
  puts "Add an additional address? y or n"
  user_choice = gets.chomp
  if user_choice == 'y'
    add_email
  else
    main_menu
  end
end

def add_phone
  puts "What is your phone number?"
  phone_input = gets.chomp

  new_phone = Phone.create(phone_input)
  @current_contact.add_phone(new_phone)
  puts "Phone number added!"
  puts "Add an additional phone number? y or n"
  user_choice = gets.chomp
  if user_choice == 'y'
    add_phone
  else
    main_menu
  end
end


def list_menu
  puts "\nLIST MENU"
  puts "========"
  puts @current_contact.fullname
  puts "\nPress 'a' to list addresses for this contact, 'p' to list phone numbers"
  puts "Press 'c' to list all contact names"
  puts "Press 'i' to list all of the contact's information"
  puts "Press 'e' to list emails, press 'x' to return to main menu"
  user_choice = gets.chomp

  case user_choice

  when 'a'
    list_address
  when 'p'
    list_phone
  when 'e'
    list_email
  when 'c'
    list_contacts
  when 'i'
    list_full
  when 'x'
    main_menu
  else
    puts "Sorry, invalid option"
    main_menu
  end
end

def list_full
  puts "Addresses"
  puts "========"
    @current_contact.addresses.each_with_index do |address, index|
    puts "#{index + 1}) " + address.full_address
    end
  puts "Emails"
  puts "========"
    @current_contact.emails.each_with_index do |email, index|
    puts "#{index + 1}) " + email.email
    end
  puts "Phone Numbers"
  puts "========"
    @current_contact.phones.each_with_index do |phone, index|
    puts "#{index + 1}) " + phone.phone_number
    end
    main_menu
end


def list_contacts
  Contact.all.each_with_index do |contact, index|
    puts "#{index + 1}) " + contact.fullname
  end
  puts "Which contact do you want to select?"
  contact_select = gets.chomp
  @current_contact = Contact.all[contact_select.to_i - 1]
  puts "Would you like to delete this contact? y or n?"
  delete_select = gets.chomp
  if delete_select == 'y'
    Contact.all.delete_at(contact_select.to_i - 1)
    list_contacts
  end
  main_menu
end

def list_address
  @current_contact.addresses.each_with_index do |address, index|
    puts "#{index + 1}) " + address.full_address
  end
  puts "Would you like to edit an address? y or n?"
  user_choice = gets.chomp
  if user_choice == 'y'
   puts "Which address would you like to edit?"
   address_select = gets.chomp
   address_edit = @current_contact.addresses[address_select.to_i - 1]
   puts "What would you like to change the street to?"
   edit_street = gets.chomp
   puts "What would you like to change the city to?"
   edit_city = gets.chomp
   puts "What would you like to change the state to?"
   edit_state = gets.chomp
   address_edit.edit_address(edit_street, edit_city, edit_state)
   puts "Change accepted!"
   @current_contact.addresses.each_with_index do |address, index|
   puts "#{index + 1}) " + address.full_address
   end
  end
  list_menu
end

def list_email
  @current_contact.emails.each_with_index do |email, index|
    puts "#{index + 1}) " + email.email
  end
  puts "Would you like to edit an email? y or n?"
  user_choice = gets.chomp
  if user_choice == 'y'
    puts "Which email would you like to edit?"
    email_select = gets.chomp
    email_edit = @current_contact.emails[email_select.to_i - 1]
    puts "What would you like to change the email to?"
    edit_email = gets.chomp
    email_edit.email_edit(edit_email)
    puts "Change accepted!"
    @current_contact.emails.each_with_index do |email, index|
    puts "#{index + 1}) " + email.email
  end
  end
  list_menu
end

def list_phone
  @current_contact.phones.each_with_index do |phone, index|
    puts "#{index + 1}) " + phone.phone_number
  end
  puts "Would you like to edit a phone number? y or n?"
  user_choice = gets.chomp
  if user_choice == 'y'
    puts "Which phone number would you like to edit?"
    phone_select = gets.chomp
    phone_edit = @current_contact.phones[phone_select.to_i - 1]
    puts "What would you like to change the phone number to?"
    edit_phone = gets.chomp
    phone_edit.phone_edit(edit_phone)
    puts "Change accepted!"
    @current_contact.phones.each_with_index do |phone, index|
    puts "#{index + 1}) " + phone.phone_number
    end
  end
  list_menu
end


contact_create



  #   Contact.all.each do |contact|
  #     puts contact.emails
  #   end
  # end

