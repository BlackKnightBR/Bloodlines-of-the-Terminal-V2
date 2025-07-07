class Dungeon2 < Dungeon
  def initialize(player:, inventory:, save:)
    super(player: player, inventory: inventory, save: save)
    @rusty_blade = Weapon.new('Rusty Blade', 10)
  end

  def generate_rooms
    [
      { id: '1A', enemy: 'Goblin', loot: true, next: ['2A'] },
      { id: '2A', enemy: 'Rat', loot: true, next: ['3A'] },
      { id: '3A', enemy: 'Goblin King', loot: true, next: ['END'] }
    ]
  end

  def give_loot(room)
    if room[:id] == '1A'
      puts "You loot the goblin's corpse."
      @inventory.add(@rusty_blade, 1, :player)
    else
      super
    end
  end
end