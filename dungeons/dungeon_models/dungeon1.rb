class Dungeon1 < Dungeon
  def generate_rooms
    [
      { id: '1A', enemy: 'Goblin', loot: true, next: ['2A'] },
      { id: '2A', enemy: 'Rat', loot: true, next: ['3A'] },
      { id: '3A', enemy: 'Goblin', loot: true, next: ['4A'] },
      { id: '4A', enemy: 'Goblin', loot: false, next: ['5A'] },
      { id: '5A', enemy: 'Rat', loot: true, next: ['6A'] },
      { id: '6A', enemy: 'Goblin', loot: true, next: ['7A'] },
      { id: '7A', enemy: 'Goblin', loot: false, next: ['8A'] },
      { id: '8A', enemy: 'Rat', loot: true, next: ['9A'] },
      { id: '9A', enemy: 'Goblin', loot: true, next: ['10A'] },
      { id: '10A', enemy: 'Rat', loot: false, next: ['11A'] },
      { id: '11A', enemy: 'Goblin King', loot: true, next: ['END'] }
    ]
  end

  def give_loot(room)
    if room[:id] == '1A'
      puts "You loot the goblin's corpse."
      if @player.type == 'warrior'
        @inventory.add(Weapon.new('Rusty Blade', 15), 1, :player)
        @inventory.add(Shield.new('Broquel', 10, 10), 1, :player)
        @inventory.add(Armor.new('Chain Mail', 10), 1, :player)
        @inventory.add(Booze.new('Whisky', 20), 1, :enemy)
        @inventory.add(Acid.new('Small Acid Vial', 20), 1, :enemy)
      elsif @player.type == 'mage'
        @inventory.add(Staff.new('Worn Staff', 15), 1, :player)
        @inventory.add(Shield.new('Broquel', 10, 10), 1, :player)
        @inventory.add(Armor.new('Robe', 20), 1, :player)
      else
        @inventory.add(Weapon.new('Rusty Blade', 10), 1, :player)
      end
    else
      super
    end
  end
end