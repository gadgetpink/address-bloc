# #8 tell Ruby to load the library
require_relative "entry.rb"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone, email)
# #9 create a variable to store index value
    index = 0
    @entries.each do |entry|
# #10 compare name with that of the entry
      if name < entry.name
        break
      end
      index += 1
    end
# #11 insert a new entry
    @entries.insert(index, Entry.new(name, phone, email))
  end

end