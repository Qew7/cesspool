require_relative 'game_methods.rb'
require "io/console"
require "colorized_string"

class Main

	def initialize
		system "clear" or system "cls"
		@game = GameMethods.new
		@state = true
		@game.start
	end

	def psys string
		p(ColorizedString[string].colorize(color: :orange, background: :blue))
	end

	def pres string
		p(ColorizedString[string].colorize(color: :green, background: :orange))
	end

	def cycle
		state_machine
	end

	def in_progress?
		@state
	end

	def end_game
		@state = false
	end

	def state_machine
		prompt = '> '
		p "Whats next?"
		print prompt
		input = STDIN.getch
		system "clear" or system "cls"
		case input
		when 'n'
			p "Pass to next turn"
		when 'p'
			p "Population is #{@game.population}"
		when 'e'
			p "Ending the game"
			end_game
		when 'h'
			p "Menu controls"
			p "n - next turn"
			p "h - help"
			p "e - end game"
		else
			p "Incorrect input"
		end
	end

end

game = Main.new

while(game.in_progress?)
	game.cycle
end
