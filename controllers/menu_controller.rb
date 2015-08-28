# #1 AddressBook is included
require_relative "../models/address_book"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

# #2 Display the options to the command line 
  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "

# # 3 Retrieve the user input
    selection = gets.to_i

# #7 case statement operator helps to determine proper response to user's input
    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4 
      system "clear"
      read_csv
      main_menu
    when 5
      puts "Good-bye!"
# #8 terminate the program. 0 signals the program is exiting without an error
      exit(0)
# # 9 else helps to catch invalid user input and prompt the user to retry      
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end

# #10 stub for the rest of the methods
  def view_all_entries
# #14 iterate through all entries in AddressBook using each
  @address_book.entries.each do |entry|
    system "clear"
    puts entry.to_s

# #15 call to entry_submenu to display a submenu for each entry
    entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end


  def create_entry
# #11 clear the screen before displaying entry prompts
    system "clear"
    puts "New AddressBloc Entry"
# #12 prompt the user for each entry attribute
    print "Name: "
    name = gets.chomp
    print "Phone nummber: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp
# #13 add the new entry to the address book   
    @address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
    print "Search by name: "
    name = gets.chomp
    match = @address_book.binary_search(name)
    system "clear"
    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end

  def read_csv
    print "Enter CSV file to import: "
    file_name = gets.chomp
    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end
    begin
      entry_count = @address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv      
    end
  end

  def entry_submenu(entry)
# #16 display submenu options
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
# #17 removes any trailing white space from the string gets
    selection = $stdin.gets.chomp
    case selection
# #18 when the user asks to see the next entry, we can do nothing and will be returned view_all_entries
    when "n"
# #19 code for deleting and editing in a future checkpoint   
    when "d"
      delete_entry(entry)
    when "e"
      edit_entry(entry)
      entry_submenu(entry)
# #20 return to main menu
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entries_submenu(entry)
    end
  end

  def delete_entry(entry)
    @address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

  def edit_entry(entry)
    print "Updatedname: "
    name = gets.chomp
    print "Updated phone number: "
    phone_number = gets.chomp
    print "Updated email: "
    email = gets.chomp

    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?
    system "clear"

    puts "Updated entry: "
    puts entry
  end
  def search_submenu(entry)
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp
    case selection
    when "d"
      system "clear"
      delete_entry(entry)
      main_menu
    when "e"
      edit_entry(entry)
      system(clear)
      main_menu
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      puts entry.to_s
      search_submenu(entry)
    end
  end     
end
