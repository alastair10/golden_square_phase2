require 'phone_numbers'

describe "tests the loader" do
  context "when given a name and number" do
    it "loads a hash" do
      phone = PhoneNumbers.new
      phone.extract_name("Kepler")
      phone.extract_number("07477123456")
      expect(phone.loader).to eq ({"Kepler" => "07477123456"})
    end
  end
end

