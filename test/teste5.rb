class Event
  def initialize(type: 'LoreEvent', player:, inventory:)
    @type = type
    @player = player
    @inventory = inventory
    @item = Potion.new('Big Vial', 20)
    @lore = 'In the mists of this dungeon you realize you are alone!'
  end

  def call_event
    case @type
    when 'TrapEvent'
      trap_event
    when 'TreasureEvent'
      treasure_event
    when 'LoreEvent'
      lore_event
    else
      puts "Nothing happens... yet something watches you."
    end
  end

  private 

  def trap_event
    damage = 10 + @player.level
    puts "💥 You stepped on a trap, and took some damage #{damage}"
    @player.hp -= damage
  end

  def treasure_event
    puts "🪙 You found something! #{item.name}"
    @inventory.add(@item)
  end

  def lore_event
    puts "📜 Lore whispers through the shadows..."
    puts @lore
    puts "-" * 40
    sleep(0.3)
  end
end
