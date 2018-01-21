require_relative 'state/state_saver.rb'
require_relative 'state/state_loader.rb'

class GameControls

	def self.state_machine game
		@game ||= game
		p "Turn: " + game.turn.to_s
		prompt = '> '
		p "Whats next?"
		print prompt
		input = STDIN.getch
		system "clear" or system "cls"
		case input
		when 'n'
			GameControls.next_turn
		when 'p'
			GameControls.show_population
		when 'e'
			GameControls.exit_game
		when 'h'
			GameControls.show_help
		when 's'
			GameControls.save_game
		when 'l'
			GameControls.load_game
		else
			GameControls.handle_incorrect_input
		end
	end

	def self.next_turn
		@game.pass_turn
		p "Pass to next turn"
	end

	def self.show_population
		p "Population is #{@game.population}"	
	end

	def self.exit_game
		abort("Ending the game")
	end

	def self.show_help
		p "Menu controls"
		p "n - next turn"
		p "h - help"
		p "e - end game"
	end

	def self.handle_incorrect_input
		p "Incorrect input"
	end

	def self.save_game
		StateSaver.save @game
		p "Game saved"
	end

	def self.load_game
		if File.file?('state/save.json')
			StateLoader.load
			p "Game loaded"
		else
			p "No save file"
		end
	end

end
