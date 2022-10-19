class PhoneNumbers
  def initialize
    @contact_hash = {}
    @name = ""
    @number = ""
  end

  def extract_name(diary)
    # takes instance of DiaryEntry and returns a name
    # will need to use title method from DiaryEntry
    @name = diary.title
  end

  def extract_number(diary)
    # takes instance of DiaryEntry and returns the phone number
    # will need to use contents method from DiaryEntry
    if diary.contents.delete("^0-9").length == 11
      @number = diary.contents.delete("^0-9")
    else
      ""
    end
  end

  def loader
    # loads the contact information to a contact hash
    @contact_hash[@name] = @number
  end

  def contact_list
    # returns a hash of contact info
    return @contact_hash
  end
end