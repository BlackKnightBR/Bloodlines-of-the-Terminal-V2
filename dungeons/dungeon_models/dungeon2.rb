class Dungeon2 < Dungeon
  def initialize(player:, inventory:, save:)
    super(player: player, inventory: inventory, save: save)
    @big_potion = Potion.new('Big Potion', 100)
  end

  def generate_rooms
    [
      { id: '1A', enemy: 'Goblin', loot: false, next: ['1B', '1C'] },
      { id: '1B', enemy: 'Goblin Jailer', loot: false, next: ['2A'] },
      { id: '1C', enemy: 'Goblin Acolyte', loot: true, next: ['2B'] },
      { id: '2A', enemy: 'Goblin Shaman', loot: true, next: ['3A'] },
      { id: '2B', enemy: 'Goblin Swordsman', loot: false, next: ['3A', '3B'] },
      { id: '3A', enemy: 'Goblin King', loot: true, next: ['END'] },
      { id: '3B', enemy: 'Death', loot: false, next: ['END'] }
    ]
  end

  def give_loot(room)
    if room[:id] == '1A'
      puts "📜 A crude glyph is carved into the wall: *'The pact was broken, the blood never forgives.'*"
      @inventory.add(@big_potion, 2, :player) if rand(1..2) == 1
    elsif room[:id] == '1C'
      puts "📜 A broken mask lies in the dirt. Whispers speak of a king who lost his face to greed."
      @inventory.add(@big_potion, 2, :player) if rand(1..2) == 1
    elsif room[:id] == '2A'
      puts "📜 You find a scroll, half-burnt: *'The shaman's flame once kept the void at bay.'*"
      @inventory.add(@big_potion, 2, :player) if rand(1..2) == 1
    elsif room[:id] == '3A'
      puts "📜 Etched into the stone throne: *'The king drank poison to forget his sins.'*"
      @inventory.add(@big_potion, 10, :player) if rand(1..2) == 1
    else
      super
    end
  end
end