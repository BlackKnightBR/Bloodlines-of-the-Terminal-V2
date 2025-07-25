class Dungeon
  attr_reader :rooms, :player, :inventory

  def initialize(player:, inventory:, save:)
    @player = player
    @inventory = inventory
    @rooms = generate_rooms
    @small_vial = Potion.new('Small Vial', 15)
    @save = save
  end

  def generate_rooms
    raise NotImplementedError, "Each dungeon model must define its own rooms!"
  end

  def spawn_enemy(enemy_id)
    EnemyFactory.spawn_enemy(enemy_id)
  end

  def run
    current_room_id = '1A'
    events = ['TrapEvent', 'TreasureEvent', 'LoreEvent']
    event = Event.new(player: @player, inventory: @inventory)

    while current_room_id != 'END' && @player.alive?
      room = @rooms.find { |r| r[:id] == current_room_id }
      break unless room

      puts "\n🕯️ Room #{room[:id]}: #{room[:enemy]} awaits..."
      

      enemy = spawn_enemy(room[:enemy])
      combat = Combat.new(player: @player, enemy: enemy, inventory: @inventory)
      combat.run
      
      current_room_id = handle_room_aftermath(room, event, events) if @player.alive?
      
    end

    puts "\nThe dungeon fades into silence..."

    unless @player.alive?
      puts "💀 Your story ends here... the save is lost to the void."
      File.delete("player.save") if File.exist?("player.save")
      File.delete("inventory.save") if File.exist?("inventory.save")
    else
      @save.save_object()
    end

  end

  def handle_room_aftermath(room, event, events)
    give_loot(room) if room[:loot]
    event.call_event(events.sample) if rand(1..2) == 1
    choose_next_room(room)
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
