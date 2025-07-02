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
    puts "-" * 40
    puts 'Loading Game...'
    puts "-" * 40
    sleep(3)
    main_loop
  end


  def dungeon_run(player, inventory)
    enemies = [
      Goblin.new,
      Rat.new,
      Goblin.new,
      Goblin.new,
      Rat.new,
      Goblin.new,
      Rat.new,
      Goblin.new,
      Goblin.new,
      Rat.new,
      Goblin_King.new 
    ]

    enemies.each_with_index do |enemy, i|
      puts "\n🕯️ Room #{i + 1}: #{enemy.name} awaits..."
      combat = Combat.new(player: player, enemy: enemy, inventory: inventory)
      combat.run

      if player.alive?
        if i == 0
          puts "You loot the goblin's corpse. You find a bag full of blood-stained goods..."
          sleep(1)
          if player.type == 'warrior'
            inventory.add(Weapon.new('Scimitar', 30), 1, :player)
          elsif player.type == 'mage'
            inventory.add(Staff.new('Wood Staff', 10), 1, :player)
          end
          inventory.add(Potion.new('Weak Potion', 15), 1, :player)
          inventory.add(Knife.new('Rusty Knife', 15), 2, :enemy)
          inventory.add(Armor.new('Worn Chain Mail', 10), 1, :player)
          inventory.add(Acid.new('Small Acid Vial', 20), 2, :enemy)
          inventory.add(Booze.new('Whisky', 20), 2, :enemy)
        elsif i < 10
          puts "A fallen foe. The shadows yield an item..."
          inventory.add(@healingPotion, 1, :player)
        else
          puts "The dungeon trembles. You are victorious..."
        end
      else
        puts "\n#{player.name} has fallen... The dungeon reclaims your flesh."
        break
      end
    end
  end

  def main_loop
    dungeon_run(@player, @inventory)
  end
end

game = Game.new 
game.start