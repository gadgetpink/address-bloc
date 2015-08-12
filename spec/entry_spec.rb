require_relative '../models/entry.rb'
# #1 - standard first line of an RSec test file. Says that it is a spec file and that we are testing entry. 
RSpec.describe Entry do
# #2 give context and give the test structure. All specs belong to the same context, and will test Entry attributes. 
  context "attributes" do

# #3 separate the individual tests using the it method
    it "should respond to name" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
# #4 each RSpec test ends with one or more expect methods, which declare expectations for the test
      expect(entry).to respond_to(:name)
    end

    it "should respond to phone number" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(entry).to respond_to(:phone_number)
    end

    it "should respond to email" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(entry).to respond_to(:email)
    end
  end

# #5 use new context to separate the to_s tests from the initializer tests (attributes)

  context "#to_s" do
    it "prints an entry as a string" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
# #6 We use eq to check that to_s returns a string equal to expected_string
      expect(entry.to_s).to eq(expected_string)
    end
  end
end