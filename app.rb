require_relative 'loader'

class Game
  def initialize
    @player = nil 
    @enemy = nil
    @inventory = Inventory.new
    @healingPotion = Potion.new('Healing Potion', 30)
  end

  def start
    intro 
    choose_character
    prologue
    main_loop
  end

  def main_loop
    dungeon = Dungeon1.new(player: @player, inventory: @inventory)
    dungeon.run
  end
end

game = Game.new 
game.start