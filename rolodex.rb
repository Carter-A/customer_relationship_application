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

  def modify_existing_contact
  end

  def display_all_contacts
    puts @contacts
  end

  def display_particular_contact
  end

  def display_info_by_attribute
  end

  def delete_contact
  end
end
