class GameMethods

	def init conf={}
		start
		@population = conf[:population] || 2
		@generation = 1
	end

	def population
		@population
	end

	def start
		p "Welcome to the Cesspool!"
	end

end

