class MusicTracker
  def initialize
    @tracks = []  
  end

  def add_track(track)
    fail "Nothing inputted. Track must be at least one letter." if track == ""
    @tracks << track
  end
  
  def display_tracks
    @tracks
  end
end