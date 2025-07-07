class Dungeon1 < Dungeon
  def initialize(player:, inventory:, save:)
    super(player: player, inventory: inventory, save: save)
    @acid = Acid.new('Small Acid Vial', 15)
    @whisky = Booze.new('Whisky', 15)
    @knife = Knife.new('Rusty Knife', 15)
  end

  def generate_rooms
    [
      { id: '1A', enemy: 'Goblin Jailer', loot: true, next: ['2A'] },
      { id: '2A', enemy: 'Rat', loot: true, next: ['3A'] },
      { id: '3A', enemy: 'Goblin Acolyte', loot: true, next: ['4A'] },
      { id: '4A', enemy: 'Goblin Swordsman', loot: false, next: ['5A'] },
      { id: '5A', enemy: 'Wolf', loot: true, next: ['6A'] },
      { id: '6A', enemy: 'Goblin Mage', loot: true, next: ['7A'] },
      { id: '7A', enemy: 'Goblin Squire', loot: false, next: ['8A'] },
      { id: '8A', enemy: 'Warg', loot: true, next: ['9A'] },
      { id: '9A', enemy: 'Goblin Shaman', loot: true, next: ['10A'] },
      { id: '10A', enemy: 'Rat', loot: false, next: ['11A'] },
      { id: '11A', enemy: 'Goblin King', loot: true, next: ['END'] }
    ]
  end

  def give_loot(room)
    if room[:id] == '1A'
      puts "You loot the goblin's corpse."
      if @player.type == 'warrior'
        @inventory.add(Weapon.new('Rusty Blade', 15), 1, :player)
        @inventory.add(Shield.new('Broquel', 20, 5), 1, :player)
        @inventory.add(Armor.new('Chain Mail', 10), 1, :player)
        @inventory.add(@whisky, 1, :enemy)
        @inventory.add(@acid, 1, :enemy)
      elsif @player.type == 'mage'
        @inventory.add(Staff.new('Worn Staff', 15), 1, :player)
        @inventory.add(Shield.new('Wooden Shield', 5, 20), 1, :player)
        @inventory.add(Armor.new('Robe', 20), 1, :player)
      else
        @inventory.add(Weapon.new('Rusty Blade', 10), 1, :player)
        @inventory.add(Shield.new('Big Shield', 20, 20), 1, :player)
      end
    elsif room[:id] == '2A'
        @inventory.add(@small_vial, 1, :player)
        @inventory.add(Armor.new('Boots', 5), 1, :player)
    elsif room[:id] == '3A'
        @inventory.add(@whisky, 1, :enemy)
        @inventory.add(@small_vial, 1, :player)
    elsif room[:id] == '4A'
      @inventory.add(@acid, 1, :enemy)
      @inventory.add(@small_vial, 1, :player)
    elsif room[:id] == '5A'
      @inventory.add(@small_vial, 1, :player)
      @inventory.add(@knife, 2, :enemy)
    elsif room[:id] == '6A'
      puts "You sift through scorched scrolls and shattered tomes."
      if @player.type == 'warrior'
        @inventory.add(Gauntlet.new('Fire Gauntlet', 15), 1, :player)
      elsif @player.type == 'mage'
        @inventory.add(Scroll.new('Scroll of Cinders', 10), 1, :player)
      else
        @inventory.add(Weapon.new('Pole Spear', 30), 1, :player)
      end
      @inventory.add(@small_vial, 1, :player)
    elsif room[:id] == '7A'
      puts "Bones crunch beneath your feet — a glimmer catches your eye."
      if @player.type == 'warrior'
        @inventory.add(Armor.new('Cracked Bone Helm', 8), 1, :player)
      elsif @player.type == 'mage'
        @inventory.add(Armor.new('Small Hat', 3), 1, :player)
      else
        @inventory.add(Armor.new("Fool's Helm", 5), 1, :player)
      end
      @inventory.add(@small_vial, 1, :player)
    elsif room[:id] == '8A'
      puts "You tear through sticky webbing and find something clutched in remains."
      if @player.type == 'warrior'
        @inventory.add(Armor.new('Cracked Bone Helm', 8), 1, :player)
      elsif @player.type == 'mage'
        @inventory.add(Armor.new('Small Hat', 3), 1, :player)
      else
        @inventory.add(Armor.new("Fool's Helm", 5), 1, :player)
      end
      @inventory.add(@small_vial, 1, :player)
    elsif room[:id] == '9A'
      puts "Dark glyphs pulse as you approach the altar — relics are strewn around."
      @inventory.add(Booze.new('Distilled Madness', 25), 1, :enemy)
      @inventory.add(@small_vial, 1, :player)
    elsif room[:id] == '10A'
      puts "Among the filth and nests, something glints."
      @inventory.add(@small_vial, 1, :player)
    elsif room[:id] == '11A'
      puts "You pry open the chest beneath the grotesque throne."
      if @player.type == 'warrior'
        @inventory.add(Weapon.new('Cursed Blade', 25), 1, :player)
      elsif @player.type == 'mage'
        @inventory.add(Staff.new('Shaman Staff', 25), 1, :player)
      else
        @inventory.add(Weapon.new("King's club", 80), 1, :player)
      end
    else
      super
    end
  end
end