require_relative 'loader'

class Game
  def initialize
    @player = nil 
    @enemy = nil
    @dungeon = nil
    @inventory = Inventory.new
    @healingPotion = Potion.new('Healing Potion', 30)
  end

  def start
    intro 
    choose_character
    prologue
    choose_dungeon
    main_loop
  end

  def main_loop
    @dungeon.run
  end
end

game = Game.new 
game.start