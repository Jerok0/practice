#A brainfuck attempt with ruby
#todo < > + - . , [ ]
class Brainfuck
	#private getmatch
	def initialize(code, input)
		@code = code
		@input = input
		@ram = Array.new()
		@cp = 0
		@ip = 0
		@rm = 0
		@out = ""
	end
	
	def getmatch (tofind, original)
		move = tofind == ']' ? 1 : -1
		nest = 0
		while true
			@cp += move
			if @code[@cp] == original
				nest += 1
			elsif @code[@cp] == tofind
				nest -= 1
			end
			if nest == -1
			end
		end
	end
	private :getmatch
	def parse
		while at = @code[@cp]
			case at
			when '>'
				@rm += 1
			when '<'
				@rm -= 1
			when '+'
				@ram[@rm] = 0 unless @ram[@rm]
				@ram[@rm] += 1
				@ram[@rm] = 0 if @ram[@rm] > 255
			when '-'
				@ram[@rm] = 0 unless @ram[@rm]
				@ram[@rm] -= 1
				@ram[@rm] = 255 if @ram[@rm] < 0
			when '.'
				@out += @ram[@rm].chr
			when ','
				@ram[@rm] = @input[@ip].ord
				@ip += 1
			when '['
				getmatch(']', '[') if @ram[@rm] == 0
				
			when ']'
				getmatch('[', ']') if @ram[@rm]!= 0
			end
			@cp+=1
		end
		@out
	end
end


alsa = Brainfuck.new(",.+++++++++++++++.------------------.++++++++.", "f")
puts alsa.parse

