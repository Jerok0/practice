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

  def describe
  	"The song #{@name} is written by #{@artist}. Enjoy listening to this song for #{@duration}s"
  end
end	

class SongList
  def initialize
    @arr = Array.new()
    @index = WordIndex.new
  end

  def append el
    @arr.push(el)
    @index.add_to_index(el, el.name, el.artist)
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

  def lookup(word)
  	@index[word.downcase]
end

class WordIndex
	def initialize()
		@index = {}
	end

	def add_to_index(obj, *phrases)
		phrases.each do |phrase|
			phrase.scan(/\w[-\w']+/) do |word|
				word.downcase!
				@index[word] = [] if @index[word].nil?
				@index[word].push(obj)
			end
		end
	end
	# def lookup (word)
	# 	@index[word.downcase]
	# end
end

File.open ("data.dat") do |song_file|
	songs = SongList.new
	song_file.each do |line|
		file, length, name, title = line.chomp.split(/\s*\|\s*/)
		mins, secs = length.scan(/\d+/)
		songs.append(Song.new(title, name.squeeze!, mins.to_i*60+secs.to_i))
	end

end