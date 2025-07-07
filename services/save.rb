require 'yaml'

class Save
  def initialize(player:, inventory:)
    @player = player
    @inventory = inventory
  end

  def save(filename = "save.yaml")
    data = {
      player: {
        name: @player.name,
        hp: @player.hp,
        attack: @player.attack,
        defense: @player.defense,
        level: @player.level,
        xp: @player.xp,
        type: @player.type
      },
      inventory: @inventory.items.map do |item, (qty, type)|
        {
          name: item.name,
          type: item.class.to_s,
          quantity: qty,
          owner: type
        }
      end
    }

    File.write(filename, data.to_yaml)
    puts "🔒 Progress saved to #{filename}."
  end

  def self.load(filename = "save.yaml")
    return nil unless File.exist?(filename)
    data = YAML.load_file(filename)

    # reconstruir jogador
    player_data = data[:player]
    player = case player_data[:type]
             when 'warrior'
               Warrior.new(
                 name: player_data[:name],
                 hp: player_data[:hp],
                 attack: player_data[:attack],
                 defense: player_data[:defense],
                 level: player_data[:level],
                 xp_given: 100
               ).tap { |p| p.xp = player_data[:xp] }
             when 'mage'
               Mage.new(
                 name: player_data[:name],
                 hp: player_data[:hp],
                 attack: player_data[:attack],
                 defense: player_data[:defense],
                 level: player_data[:level],
                 xp_given: 100
               ).tap { |p| p.xp = player_data[:xp] }
             else
               Character.new(name: player_data[:name])
             end

    # reconstruir inventário
    inventory = Inventory.new
    data[:inventory].each do |item_data|
      klass = Object.const_get(item_data[:type])
      item = klass.new(item_data[:name])
      inventory.add(item, item_data[:quantity], item_data[:owner].to_sym)
    end

    puts "📖 Save loaded from #{filename}."

    { player: player, inventory: inventory }
  end
end
