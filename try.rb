require 'test/unit'
class SongList
  def initialize
    @arr = Array.new()
  end

  def append el
    @arr.push(el)
    self
  end

  def delete_f
    @arr.shift
  end

  def delete_l
    @arr.pop
  end

  def [](index)
    @arr[index]
  end
end

class Testslist < Test::Unit::TestCase
  def test_delete
    list = SongList.new
    s1 = "Where you go"
    s2 = "Matters whats home"
    s3 = "Never take a break"
    s4 = "Who you are"

    list.append(s1).append(s2).append(s3).append(s4)

    assert_equal(s1, list[0])
    assert_equal(s2, list[1])
    assert_nil (list[21])

    assert_equal(s1, list.delete_f)
    assert_equal(s2, list.delete_f)
    assert_equal(s4, list.delete_l)
    assert_equal(s3, list.delete_l)
    a = Song.new("Yashimoto", "Mozikino", 123)
    assert_equal(a.name, 'Yashimoto')
    a.duration = 1337
    assert_equal(a.duration, 1337)
    a.play
    a.play
    assert_equal(Song.total_plays, 2)
    assert_equal(a.playcount, 2)
  end
end


class Song
  attr_writer :duration
  attr_accessor :name, :duration, :artist
  @@playcount = 0
  
  def initialize (name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
    @plays = 0
  end

  def play
    puts "Playing the song, Enjoy!"
    @plays += 1
    @@playcount += 1
  end
  
  def Song.total_plays
    @@playcount
  end

  def playcount
    @plays
  end

end