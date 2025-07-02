def choose_dungeon
  puts 'Player! Choose your dungeon!'
  puts '1. Goblin Cave'
  puts '2. Goblin Maze'
  print '> '
  choice = gets.chomp.strip

  @dungeon = case choice
             when '1'
               Dungeon1.new(player: @player, inventory: @inventory)
             when '2'
               Dungeon2.new(player: @player, inventory: @inventory)
             else
               puts 'Fool! You think you can trick the trickster?!'
               DungeonFinal.new(player: @player, inventory: @inventory)
             end
end