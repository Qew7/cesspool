require_relative 'state_manager.rb'

class StateSaver < StateManager
	def self.save game
		open('state/save.json', 'w') { |f| f.puts StateSaver.attributes(game).to_json }
	end
end