require_relative 'loader'

class Game
  def initialize
    @player = nil 
    @enemy = nil
    @dungeon = nil
    @inventory = nil
    @save = nil
  end

  def start
    choose_load

    # Caso o jogador não tenha carregado um save válido, prossegue com criação
    unless @player && @inventory
      intro
      choose_character
      @inventory = Inventory.new
    end

    prologue
    @save = Save.new(player: @player, inventory: @inventory)
    choose_dungeon
    main_loop
  end

  def main_loop
    @dungeon.run
  end

  def choose_load
    puts '📜 Do you want to load a previous save? (y/n)'
    print '> '
    choice = gets.chomp.downcase

    if choice == 'y' && File.exist?("player.save") && File.exist?("inventory.save")
      begin
        @player = @save.load_player
        @inventory = @save.load_inventory
        puts "💾 Welcome back, #{@player.name}..."
        sleep(0.3)
      rescue => e
        puts "⚠️ Save file is corrupted or unreadable. A new story begins..."
        puts "🛠️ Error: #{e.message}"
      end
    else
      puts "✨ A new story begins..."
    end
  end
end

game = Game.new 
game.start