class Dungeon
  attr_reader :rooms, :player, :inventory

  def initialize(player:, inventory:)
    @player = player
    @inventory = inventory
    @rooms = generate_rooms
    @small_vial = Potion.new('Small Vial', 15)
  end

  def generate_rooms
    raise NotImplementedError, "Each dungeon model must define its own rooms!"
  end

  def spawn_enemy(enemy_id)
    EnemyFactory.spawn_enemy(enemy_id)
  end

  def run
    current_room_id = '1A'

    while current_room_id != 'END' && @player.alive?
      room = @rooms.find { |r| r[:id] == current_room_id }
      break unless room

      puts "\n🕯️ Room #{room[:id]}: #{room[:enemy]} awaits..."

      enemy = spawn_enemy(room[:enemy])
      combat = Combat.new(player: @player, enemy: enemy, inventory: @inventory)
      combat.run

      give_loot(room) if room[:loot] && @player.alive?

      current_room_id = choose_next_room(room)
    end

    puts "\nThe dungeon fades into silence..."
  end

  def choose_next_room(room)
    return room[:next].first if room[:next].size == 1

    puts 'Choose your path:'
    room[:next].each_with_index { |id, i| puts "#{i + 1}) #{id}" }
    print '> '
    choice = gets.chomp.to_i
    room[:next][choice - 1]
  end

  def give_loot(room)
    # Custom logic in subclass if needed
    puts "You find something in the dark..."
    @inventory.add(@small_vial, 1, :player)
  end
end
