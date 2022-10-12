require 'todo_checker'

RSpec.describe "checking if a string is a todo or not" do
  context "given an empty string" do
    it "returns empty list" do
      result = checker("")
      expect(result).to eq "To Do List:"
    end
  end

  context "given #TODO" do
    it "returns to do list with new item" do
      result = checker("#TODO")
      expect(result).to eq "To Do List: #TODO"
    end
  end


  context "given wash socks" do
    it "returns empty list" do
      result = checker("wash socks")
      expect(result).to eq "To Do List:"
    end
  end

  context "given wash socks #TODO" do
    it "returns the list with this item" do
      result = checker("wash socks #TODO")
      expect(result).to eq "To Do List: wash socks #TODO"
    end
  end

  context "#TODO brush teeth" do
    it "returns yes" do
      result = checker("#TODO brush teeth")
      expect(result).to eq "To Do List: #TODO brush teeth"
    end
  end

  context "fold #TODO laundry" do
    it "returns yes" do
      result = checker("fold #TODO laundry")
      expect(result).to eq "To Do List: fold #TODO laundry"
    end
  end

  context "take out trash #TO DO" do
    it "returns no" do
      result = checker("take out trash #TO DO")
      expect(result).to eq "To Do List:"
    end
  end
end