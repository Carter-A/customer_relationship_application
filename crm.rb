require_relative "contact"
require_relative "rolodex"

class CRM
  def self.run(name)
    crm = CRM.new(name)
    crm.main_menu
  end

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display a contact"
    puts "[5] Display all the contacts"
    puts "[6] Display an attribute"
    puts "[7] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected == 2
    delete_contact if user_selected == 3
    display_a_contact if user_selected == 4
    display_all_contacts if user_selected == 5
    display_attribute if user_selected == 6
    return if user_selected == 7

    main_menu
  end

  def add_new_contact
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)

    #need to add contact to rolodex as well
    @rolodex.add_contact(contact)
  end

  def modify_existing_contact
    @rolodex.modify_existing_contact
  end

  def delete_contact
    @rolodex.delete_contact
  end

  def display_a_contact
    @rolodex.display_a_contact
  end

  def display_all_contacts
    @rolodex.display_all
  end

  def display_attribute
    @rolodex.display_attribute
  end

end
CRM.run("my CRM")
