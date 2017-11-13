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

	def main
		mainStateMachine
	end

	def inProgress?
		@state
	end

	def endGame
		@state = false
	end

	def mainStateMachine
		prompt = '> '
		p "Whats next?"
		print prompt
		input = STDIN.getch
		case input
		when 'n'
			p "Pass to next turn"
		when 'p'
			p "Population is #{@game.population}"
		when 'e'
			p "Ending the game"
			endGame
		when 'h'
			p "n - next turn"
			p "h - help"
			p "e - end game"
		else
			p "Incorrect input"
		end
	end

end

main = Main.new

while(main.inProgress?)
	main.main
end
