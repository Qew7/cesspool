require_relative 'game_controls.rb'

class GameMethods

	attr_accessor :turn, :generation, :population

	def initialize conf={}
		start
		@population = conf[:population] || 2
		@generation = conf[:generation] || 1
		@turn = conf[:turn] || 0
	end

	def pass_turn
		@turn = @turn + 1
	end

	def start
		p "Welcome to the Cesspool!"
	end

	def handle_input
		GameControls.state_machine self
	end

end

