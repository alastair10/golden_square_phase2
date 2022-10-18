class PhoneNumbers
  
  def initialize
    @phone_number = ""
    @name = ""
    @my_hash = {}
  end

  def extract_name(diary)
    # takes instance of DiaryEntry and returns a name
    # will need to use ttitle method from DiaryEntry
    @name = diary.title
    return @name
  end

  def extract_number(diary)
    # takes instance of DiaryEntry and returns the phone number
    # will need to use contents method from DiaryEntry
    diary.contents.delete("^0-9").length == 11  ? @phone_number = diary.contents.delete("^0-9") : ""
    return @phone_number
  end

  def loader
    # loads the contact information to a contact list
    @my_hash[@name] = @phone_number
  end

  def contact_list
    # returns a hash of contact info
    return @my_hash
  end
end