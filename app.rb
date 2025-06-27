# ╔══════════════════════════════════════════════╗
# ║       Bloodlines of the Terminal - v1.0      ║
# ╠══════════════════════════════════════════════╣
# ║  A terminal-based dark fantasy RPG built in  ║
# ║  Ruby, where blood, steel, and logic clash.  ║
# ╠══════════════════════════════════════════════╣
# ║✅ Two playable classes: Warrior and Mage    ║
# ║✅ Unique skills powered by rage/charm       ║
# ║✅ 11 dungeon rooms + final boss             ║
# ║✅ Inventory with consumables, weapons, etc  ║
# ║✅ Item effects (HP, Attack, Defense, Debuffs)
# ║✅ Fully interactive combat system           ║
# ║✅ Dynamic loot system                       ║
# ║✅ Input validation and status feedback      ║
# ║✅ Clear victory & defeat states             ║
# ╠══════════════════════════════════════════════╣
# ║   Version 1.0 is feature complete and stable ║
# ╚══════════════════════════════════════════════╝

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

  def intro
    puts 'Welcome to Bloodlines of the Terminal...'
    puts 'Prepare yourself, for blood shall be spilled!'
  end

  def choose_character
    puts 'What is your name peasant?'
    print '> '
    name = gets.chomp.strip
    name = 'Douche' if name.empty?

    puts 'Player! Choose your destiny!'
    puts '1. Warrior'
    puts '2. Mage'
    print '> '
    char = gets.chomp

    case char
    when '1'
      @player = Warrior.new(name: name)
    when '2'
      @player = Mage.new(name: name)
    else
      puts 'Fool! You think you can trick the trickster?!'
      puts 'A nameless husk you shall be!'
      @player = Character.new(name: 'Nameless Husk')
    end
  end

  def menu_show 
    puts '1) Attack'
    puts '2) Pass'
    puts '3) Use unique class move!'
    puts '4) Check Status'
    puts '5) Inventory'
  end

  def combat(player, enemy, inventory)
    puts "#{enemy.name} emerges from the shadows!"
    puts "The battle between #{player.name} and #{enemy.name} begins..."

    while player.alive? && enemy.alive?
      puts "\nYour move, #{player.name}:"
      menu_show
      print '> '
      char = gets.chomp
      case char
      when '1'
        player.attack_target(enemy)
      when '2'
        puts "#{player.name} lingers in hesitation... The darkness grins, unfazed."
        puts "-" * 40
      when '3'
        player.skill_move(enemy)
      when '4'
        player.status
      when '5'
        if inventory.empty?
          puts "You reach into your bag... but find only dust and shame."
          next
        end
        puts "-" * 40
        sleep(0.5)
        puts '0) Back'
        inventory.show
        puts 'Choose your item!'
        print '> '
        input = gets.chomp

        # Verifica se é um número válido
        if input =~ /^\d+$/  # regex para apenas dígitos
          index = input.to_i
           if index == 0
            puts "-" * 40
            puts 'You close your bag...'
            sleep(0.5)
            next
           else
            index -= 1
           end

          if index.between?(0, inventory.items_count - 1)
            inventory.use(index, player, enemy)
          else
            puts "Invalid choice! That item doesn't exist."
          end
        else
          puts "Invalid input! Only numbers are accepted."
        end
      else
        puts "Invalid move! You hesitate #{player.name}, and time slips away..."
      end

      if enemy.alive?
        enemy.attack_target(player)
      end

      puts "-" * 30
      sleep(0.5)
    end

    puts player.alive? ? "#{player.name} stands victorious amidst the bloodied ruins." : "#{player.name} falls to darkness..."
    sleep(1)
  end

  def prologue
    puts <<~TEXT
      You awaken in shadows, your mind fogged with fractured memories 
      of a brutal capture by a savage band of Goblins.
      
      The darkness of the cramped cell wraps around you, but the door stands ajar—
      creaking like a sinister invitation into the unknown...

      You rise... something inside you hungers for revenge.
    TEXT
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
      combat(player, enemy, inventory)

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