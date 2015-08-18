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
    puts "5 - View entry by number"
    puts "6 - Exit"
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
      system "clear"
      puts "What entry would you like to view?"
      view_entry_number
      main_menu
    when 6
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
  end

  def read_csv
  end

  def view_entry_number
    number = gets.chomp.to_i

    if number.is_a? Integer
      entry = @address_book.get_entry(number)
      puts entry.to_s
    else
      puts "Please enter a valid number"
      get_entry
    end

  def entry_submenu(entry)
# #16 display submenu options
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
# #17 removes any trailing white space from the string gets
    selection = gets.chomp
    case selection
# #18 when the user asks to see the next entry, we can do nothing and will be returned view_all_entries
    when "n"
# #19 code for deleting and editing in a future checkpoint   
    when "d"
    when "e"
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
end
end
