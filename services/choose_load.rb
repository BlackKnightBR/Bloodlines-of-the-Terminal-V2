def choose_load
  puts '📜 Do you want to load a previous save? (y/n)'
  print '> '
  choice = gets.chomp.downcase

  if choice == 'y' && File.exist?("save.yaml")
    data = Save.load
    if data
      @player = data[:player]
      @inventory = data[:inventory]
      puts "💾 Welcome back, #{@player.name}..."
    else
      puts "⚠️ Save file is corrupted or unreadable. A new story begins..."
      @player = nil
      @inventory = Inventory.new
    end
  else
    puts "✨ A new story begins..."
    @player = nil
    @inventory = Inventory.new
  end
end