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