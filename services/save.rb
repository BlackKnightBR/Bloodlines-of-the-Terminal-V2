class Save
  def initialize(player:, inventory:)
    @player = player
    @inventory = inventory
  end

  def save_object()
    filename1 = "player.save"
    filename2 = "inventory.save"
    File.open(filename1, 'wb') do |file|
      Marshal.dump(@player,file)
    end
    File.open(filename2, 'wb') do |file|
      Marshal.dump(@inventory,file)
    end
    puts "🧪 Game state saved to #{filename1} and #{filename2}"
  end

  def load_player(filename = "player.save")
    return nil unless File.exist?(filename)

    File.open(filename, 'rb') do |file|
      obj = Marshal.load(file)
      puts "Object loaded from #{filename}"
      return obj
    end
  end

  def load_inventory(filename = "inventory.save")
    return nil unless File.exist?(filename)

    File.open(filename, 'rb') do |file|
      obj = Marshal.load(file)
      puts "Object loaded from #{filename}"
      return obj
    end
  end
end
