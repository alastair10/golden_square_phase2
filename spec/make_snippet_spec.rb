require 'make_snippet'

RSpec.describe "check snippet method" do
  it "returns a list of words" do
    result = snippet("hello, world, goodbye, coding, ruby, extra")
    expect(result).to eq "hello, world, goodbye, coding, ruby,..."
  end
end