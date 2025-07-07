def choose_dungeon
  puts 'Player! Choose your dungeon!'
  puts '1. Goblin Cave'
  puts '2. Goblin Maze'
  print '> '
  choice = gets.chomp.strip

  case choice
  when '1'
    @dungeon = Dungeon1.new(player: @player, inventory: @inventory, save: @save)
  when '2'
    @dungeon = Dungeon2.new(player: @player, inventory: @inventory, save: @save)
  else
    puts 'Fool! You think you can trick the trickster?!'
    sleep(0.5)
    puts 'A cursed path unfolds...'
    @dungeon = DungeonFinal.new(player: @player, inventory: @inventory, save: @save)
  end
end