class Inventory
  def initialize
    @items = {} # Ex: { potion => [2, :player], bomb => [1, :enemy] }
  end

  def add(item, quantity = 1, type = :player)
    if @items.key?(item)
      @items[item][0] += quantity
    else
      @items[item] = [quantity, type]
    end
  end

  def show
    puts "Inventory:"
    @items.each_with_index do |(item, (qty, type)), i|
      puts "#{i + 1}) #{item.name} (x#{qty}) [#{type}]"
    end
  end

  def use(index, player, enemy = nil)
    item_key = @items.keys[index]
    
    if item_key.nil?
      puts 'No such item.'
      return 
    end

    quantity, type = @items[item_key]

    target = case type
             when :player then player
             when :enemy  then enemy
             else
               puts "Unknown item type: #{type}"
               return
             end

    item_key.use(target)
    @items[item_key][0] -= 1
    @items.delete(item_key) if @items[item_key][0] <= 0
  end

  def items_count
    @items.size
  end

  def empty?
    @items.empty?
  end
end
