require "test/unit"
load "brainfuck.rb"

class TestBrain < Test::Unit::TestCase
	def test1
		#goco = Brainfuck.new("+++++++++>+++>>++<++", "")
		#goco.parse
		# assert_equal(goco.getram(0), 9)
		# assert_equal(goco.getram(1), 3)
		# assert_equal(goco.getram(2), 2)
		# assert_equal(goco.getram(3), 2)

		goco = Brainfuck.new(",+++.", "a")
		#goco.parse
		#assert_equal(100, goco.getram(0))
		assert_equal(goco.parse, "d")
		#assert_equal(goco.getin, "a")
		#goco = Brainfuck.new("[[]]", "")
		#assert_equal(goco.getmatch(']', '['), 3)

		goco = Brainfuck.new("++++++++++[>+++++++>++++++++++>+++>+>++++<<<<<-]>++.>+.+++++++..+++.>>>++++.<<++.<++++++++.--------.+++.------.--------.>+.>.", "Hello, World!")
		#goco.parse
		assert_equal("fuck", goco.parse)
	end
end