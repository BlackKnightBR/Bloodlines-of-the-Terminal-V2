require 'yaml'

class Save
  def initialize (player:, inventory:)
    @player = player
    @inventory = inventory
  end

  def save(filename = "save.yaml")
    data = {
      player_name: @player,
      inventario: @inventory
    }
    File.write(filename, data.to_yaml)
    puts "🔒 Progresso salvo em #{filename}."
  end
end

