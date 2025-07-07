# 1- Criar uma tabela de dano baseado em nível:
nivel = 1

case nivel
when 1..3 then puts 'You have no power mortal shell!'
when 4..7 then puts 'You hit the target!'
when 8..10 then puts 'Your hits are from a worthy opponent'
else puts 'The dungeon fears you!'
end

# 2- Sistema de sorte para loot aleatório:
roll = rand(1..100)
puts "Your dice decides the fate, your D - 100 roll: #{roll}"
loot = case roll
        when 1..50 then 'Small Vial'
        when 51..85 then 'Rusty Sword'
        when 86..100 then 'Ancient Relic'
      end

puts "You found: #{loot}"

# 3- Evento de dano contínuo (área com gás venenoso):
turns = (1..5)
turns.each { |i| puts "Turn #{i}: The poison stings inside. HP -5"}