require_relative 'game_methods.rb'
require "io/console"
require "colorized_string"

class Main

	def initialize
		system "clear" or system "cls"
		@game = GameMethods.new
		@state = true
	end

	def cycle
		@game.handle_input
	end

	def in_progress?
		@state
	end

end

game = Main.new

while(game.in_progress?)
	game.cycle
end
