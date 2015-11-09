class Contact
  attr_accessor :first_name, :last_name, :email, :note, :id
  @@contacts = []
  @@id = 1000

  def initialize(first_name, last_name, options = {})
    @first_name = first_name
    @last_name = last_name
    @email = options[:email]
    @note = options[:note]

    @id = @@id
    @@id += 1
  end

  def self.create(first_name, last_name, options = {})
    new_contact = Contact.new(first_name, last_name, options)
    @@contacts << new_contact
  end

  def self.display_a_contact
    puts "Enter the ID of the contact to display"
    contact_display_id = gets.to_i
    @@contacts.each do |contact|
      if contact.id == contact_display_id
        puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note} #{contact.id}"
      end
    end
    puts "Press enter to continue"
    continue = gets.chomp
  end

  def self.display_all
    @@contacts.each do |contact|
      puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note} #{contact.id}"
    end
    puts "Press enter to continue"
    continue = gets.chomp
  end

  def self.modify_call_option(modify_user_selected, contact_modify_id)
    change_first_name(contact_modify_id) if modify_user_selected == 1
    change_last_name(contact_modify_id) if modify_user_selected == 2
    change_email(contact_modify_id) if modify_user_selected == 3
    change_note(contact_modify_id) if modify_user_selected == 4
    return if modify_user_selected == 5
  end

  def self.change_first_name(contact_modify_id)
    puts "Enter the new first name"
    new_first_name = gets.chomp
    @@contacts.each do |contact|
      if contact.id == contact_modify_id
        contact.first_name = new_first_name
      else
        puts "User ID error"
        x = gets.chomp
      end
    end
  end

  def self.change_last_name(contact_modify_id)
    puts "Enter the new last name"
    new_last_name = gets.chomp
    @@contacts.each do |contact|
      if contact.id == contact_modify_id
        contact.last_name = new_last_name
      end
    end
  end

  def self.change_email(contact_modify_id)
    puts "Enter the new email"
    new_email = gets.chomp
    @@contacts.each do |contact|
      if contact.id == contact_modify_id
        contact.email = new_email
      end
    end
  end

  def self.change_note(contact_modify_id)
    puts "Enter new note"
    new_note = gets.chomp
    @@contacts.each do |contact|
      if contact.id == contact_modify_id
        contact.note = new_note
      end
    end
  end

  def self.delete_contact
    puts "Enter ID of contact to delete"
    delete_contact_id = gets.to_i
    @@contacts.delete_if do |contact|
      contact.id == delete_contact_id
    end
  end

  def self.display_attribute
    puts "Enter the attribute to display for each contact"
    puts "first names, last names, emails, or notes"
    contact_attr = gets.chomp
    @@contacts.each do |contact|
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
