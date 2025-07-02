class Dungeon1 < Dungeon
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
      @inventory.add(Weapon.new('Rusty Blade', 10), 1, :player)
    else
      super
    end
  end
end