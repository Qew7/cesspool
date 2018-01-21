require_relative 'state_manager.rb'

class StateLoader < StateManager
	def self.load
		x = GameMethods.new JSON.parse(File.read('state/save.json'))
		p StateSaver.attributes x
	end
end