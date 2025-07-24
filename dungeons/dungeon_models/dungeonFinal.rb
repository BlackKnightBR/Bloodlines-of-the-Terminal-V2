class DungeonFinal < Dungeon
  def initialize(player:, inventory:, save:)
    super(player: player, inventory: inventory, save: save)
  end

  def generate_rooms
    [
      { id: '1A', enemy: 'Death', loot: true, next: ['END'] },
    ]
  end

  def give_loot(room)
    if room[:id] == '1A'
      puts "You deserve nothing!"
    else
      super
    end
  end
end