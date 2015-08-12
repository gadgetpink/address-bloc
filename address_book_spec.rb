require_relative '../models/address_book.rb'

RSpec.describe AddressBook do 
  context "attributes" do
    it "should respond to entries" do
      book = AddressBook.ne
      expect(book).to respond_to(:entries)
    end
  end  
end