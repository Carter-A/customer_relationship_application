class Rolodex
  attr_accessor :display_all_contacts, :add_contact

  def initialize
    @contacts = []
    @id = 1000
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def display_a_contact
    puts "Enter the ID of the contact to display"
    contact_display_id = gets.to_i
    @contacts.each do |contact|
      if contact.id == contact_display_id
        puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note} #{contact.id}"
      end
    end
    puts "Press enter to continue"
    continue = gets.chomp
  end

  def display_all
    @contacts.each do |contact|
      puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note} #{contact.id}"
    end
    puts "Press enter to continue"
    continue = gets.chomp
  end

  def modify_existing_contact
    puts "Enter user ID"
    @contact_modify_id = gets.to_i
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
    modify_call_option(modify_user_selected)
  end

  def modify_menu
    puts "[1] Change first name"
    puts "[2] Change last name"
    puts "[3] Change email address"
    puts "[4] Change note"
    puts "[5] Cancel"
    puts "Enter a number: "
  end

  def modify_call_option(modify_user_selected)
    change_first_name if modify_user_selected == 1
    change_last_name if modify_user_selected == 2
    change_email if modify_user_selected == 3
    change_note if modify_user_selected == 4
    return if modify_user_selected == 5
  end

  def change_first_name
    puts "Enter the new first name"
    new_first_name = gets.chomp
    @contacts.each do |contact|
      if contact.id == @contact_modify_id
        contact.first_name = new_first_name
      end
    end
  end

  def change_last_name
    puts "Enter the new last name"
    new_last_name = gets.chomp
    @contacts.each do |contact|
      if contact.id == @contact_modify_id
        contact.last_name = new_last_name
      end
    end
  end

  def change_email
    puts "Enter the new email"
    new_email = gets.chomp
    @contacts.each do |contact|
      if contact.id == @contact_modify_id
        contact.email = new_email
      end
    end
  end

  def change_note
    puts "Enter new note"
    new_note = gets.chomp
    @contacts.each do |contact|
      if contact.id == @contact_modify_id
        contact.note = new_note
      end
    end
  end

  def delete_contact
    puts "Enter ID of contact to delete"
    delete_contact_id = gets.to_i
    @contacts.delete_if do |contact|
      contact.id == delete_contact_id
    end
  end

  def display_attribute
    puts "Enter the attribute to display for each contact"
    puts "first names, last names, emails, or notes"
    contact_attr = gets.chomp
    @contacts.each do |contact|
      if contact_attr == "first names"
        puts contact.first_name
      elsif contact_attr == "last names"
        puts contact.last_name
      elsif contact_attr == "emails"
        puts contact.email
      elsif contact_attr == "notes"
        puts contact.notes
      end
    end
    puts "Press enter to continue"
    continue = gets
  end

end
