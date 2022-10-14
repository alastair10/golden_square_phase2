require 'music_tracker'

describe MusicTracker do
  it "returns empty list of tracks when no tracks have been added" do
    my_tracks = MusicTracker.new
    expect(my_tracks.display_tracks).to eq []
  end

  it "returns one track when a single track has been added" do
    my_tracks = MusicTracker.new
    my_tracks.add_track("I Write Sins Not Tradegies")
    expect(my_tracks.display_tracks).to eq ["I Write Sins Not Tradegies"]
  end

  it "returns multiple tracks when a multiple tracks have been added" do
    my_tracks = MusicTracker.new
    my_tracks.add_track("I Write Sins Not Tradegies")
    my_tracks.add_track("What's My Age Again")
    expect(my_tracks.display_tracks).to eq ["I Write Sins Not Tradegies", "What's My Age Again"]
  end

  it "returns error message when blank string is passed" do
    my_tracks = MusicTracker.new
    expect {my_tracks.add_track("")}.to raise_error "Nothing inputted. Track must be at least one letter."
  end
end