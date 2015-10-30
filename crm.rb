require_relative "contact"

class CRM
  def self.run(name)
    crm = CRM.new(name)
    puts "\e[H\e[2J"
    crm.main_menu
  end

  def initialize(name)
    @name = name
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

    puts "\e[H\e[2J"
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
    Contact.create(first_name, last_name, email: email, note: note)
  end

  def modify_existing_contact
    Contact.modify_existing_contact
  end

  def delete_contact
    Contact.delete_contact
  end

  def display_a_contact
    Contact.display_a_contact
  end

  def display_all_contacts
    Contact.display_all
  end

  def display_attribute
    Contact.display_attribute
  end

end
CRM.run("my CRM")
