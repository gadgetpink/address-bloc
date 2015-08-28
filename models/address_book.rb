# #8 tell Ruby to load the library
require_relative "entry.rb"
require "csv"

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

  def import_from_csv(file_name)
    csv_text =File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end

end