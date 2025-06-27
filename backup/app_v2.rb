require_relative 'characters/loader'

class Game
  def initialize
    @player = nil 
    @enemy = nil
  end

  def start
    intro 
    choose_character
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

  def combat(player, enemy)
    puts "#{enemy.name} emerges from the shadows!"

    while player.alive? && enemy.alive?
      puts "\nYour move, #{player.name}:"
      puts '1) Attack'
      puts '2) Pass'
      print '> '
      char = gets.chomp
      case char
      when '1'
        player.attack(enemy)
      when '2'
        puts 'Waiting for oponents next move!'
      else
        puts "Invalid move! You hesitate #{player.name}, and time slips away..."
      end

      if enemy.alive?
        enemy.attack(player)
      end

      puts "-" * 30
      sleep(0.5)
    end

    if player.alive?
      puts "#{player.name} is victorious!"
    else
      puts "#{player.name} has fallen..."
    end
  end

  def main_loop
    @enemy = Character.new(name: 'Ratling', hp: 50, attack: 8, defense: 3)
    combat(@player, @enemy)
  end
end

game = Game.new 
game.start