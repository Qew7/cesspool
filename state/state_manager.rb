require 'pp'
require 'json'

class StateManager

  def self.attributes game
    game.instance_variables.map do |var| 
      [var[1..-1].to_sym, game.send(var[1..-1].to_sym)]
    end.to_h
  end

end