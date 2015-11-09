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
    Contact.delete_contact if user_selected == 3
    Contact.display_a_contact if user_selected == 4
    Contact.display_all if user_selected == 5
    Contact.display_attribute if user_selected == 6
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
    puts "Enter user ID"
    @contact_modify_id = gets.chomp.to_i
    puts "Are you sure? y/n"
    confirmation = gets.chomp
    if confirmation == "y"
      modify_contact
    else
      return
    end
  end

  def modify_contact
    modify_menu
    modify_user_selected = gets.to_i
    puts modify_user_selected
    Contact.modify_call_option(modify_user_selected, @contact_modify_id)
  end

  def modify_menu
    puts "[1] Change first name"
    puts "[2] Change last name"
    puts "[3] Change email address"
    puts "[4] Change note"
    puts "[5] Cancel"
    puts "Enter a number: "
  end

end
CRM.run("my CRM")
