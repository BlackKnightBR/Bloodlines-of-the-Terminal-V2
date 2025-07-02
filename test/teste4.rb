class Dungeon_1
  attr_accessor :current_room_id
  attr_reader :rooms

  def initialize
    @rooms = [
      { id: '1A', enemy: 'Goblin Jailer',     difficulty: :normal, loot: true, type: :combat, next: ['2A'] },
      { id: '2A', enemy: 'Rat',               difficulty: :normal, loot: true, type: :combat, next: ['3A'] },
      { id: '3A', enemy: 'Goblin Squire',     difficulty: :normal, loot: true, type: :combat, next: ['4A'] },
      { id: '4A', enemy: 'Wolf',              difficulty: :normal, loot: true, type: :combat, next: ['5A'] },
      { id: '5A', enemy: 'Goblin Swordsman',  difficulty: :normal, loot: true, type: :combat, next: ['6A'] },
      { id: '6A', enemy: 'Warg',              difficulty: :normal, loot: true, type: :combat, next: ['7A'] },
      { id: '7A', enemy: 'Goblin Mage',       difficulty: :normal, loot: true, type: :combat, next: ['8A'] },
      { id: '8A', enemy: 'Goblin Shaman',     difficulty: :normal, loot: true, type: :combat, next: ['9A'] },
      { id: '9A', enemy: 'Rat',               difficulty: :normal, loot: true, type: :combat, next: ['10A'] },
      { id: '10A', enemy: 'Cerberus',         difficulty: :normal, loot: true, type: :combat, next: ['11A'] },
      { id: '11A', enemy: 'Goblin King',      difficulty: :normal, loot: true, type: :combat, next: ['END'] }
    ]
    @current_room_id = '1A'
  end
end

def run_dungeon
  dungeon = Dungeon_1.new

  while dungeon.current_room_id != 'END'
    room = dungeon.rooms.find { |r| r[:id] == dungeon.current_room_id }

    if room.nil?
      puts "❌ Error: Room #{dungeon.current_room_id} not found!"
      break
    end

    puts "\nEntering room: #{room[:id]}"
    puts "Enemy: #{room[:enemy]}"
    puts "Loot? #{room[:loot] ? 'Yes' : 'No'}"

    if room[:next].size > 1
      puts "Choose your path:"
      room[:next].each_with_index do |next_id, i|
        puts "#{i + 1}) #{next_id}"
      end
      print '> '
      choice = gets.chomp.to_i
      dungeon.current_room_id = room[:next][choice - 1]
    else
      dungeon.current_room_id = room[:next].first
    end
  end

  puts "\nYou've reached the end of the dungeon!"
end

run_dungeon
