class Combat
  def initialize(player:, enemy:, inventory:)
    @player = player
    @enemy = enemy
    @inventory = inventory
  end

  def menu_show 
    puts '1) Attack'
    puts '2) Pass'
    puts '3) Use unique class move!'
    puts '4) Check Status'
    puts '5) Inventory'
  end

  def run 
    puts "#{@enemy.name} emerges from the shadows!"
    puts "The battle between #{@player.name} and #{@enemy.name} begins..."

    while @player.alive? && @enemy.alive?
      puts "\nYour move, #{@player.name}:"
      menu_show
      print '> '
      char = gets.chomp
      case char
      when '1'
        @player.attack_target(@enemy)
      when '2'
        puts "#{@player.name} lingers in hesitation... The darkness grins, unfazed."
        puts "-" * 40
      when '3'
        @player.skill_move(@enemy)
      when '4'
        @player.status
      when '5'
        if @inventory.empty?
          puts "You reach into your bag... but find only dust and shame."
          next
        end
        puts "-" * 40
        sleep(0.5)
        puts '0) Back'
        @inventory.show
        puts 'Choose your item!'
        print '> '
        input = gets.chomp

        # Verifica se é um número válido
        if input =~ /^\d+$/  # regex para apenas dígitos
          index = input.to_i
           if index == 0
            puts "-" * 40
            puts 'You close your bag...'
            sleep(0.5)
            next
           else
            index -= 1
           end

          if index.between?(0, @inventory.items_count - 1)
            @inventory.use(index, @player, @enemy)
          else
            puts "Invalid choice! That item doesn't exist."
          end
        else
          puts "Invalid input! Only numbers are accepted."
        end
      else
        puts "Invalid move! You hesitate #{player.name}, and time slips away..."
      end

      if @enemy.alive?
        @enemy.attack_target(@player)
      end

      puts "-" * 30
      sleep(0.5)
    end

    puts @player.alive? ? "#{@player.name} stands victorious amidst the bloodied ruins." : "#{player.name} falls to darkness..."
    sleep(1)
  end
end
