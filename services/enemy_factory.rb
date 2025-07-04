class EnemyFactory
  def self.spawn_enemy(enemy_id)
    case enemy_id
    when 'Goblin'
      Goblin.new
    when 'Rat'
      Rat.new
    when 'Wolf'
      Wolf.new
    when 'Warg'
      Warg.new
    when 'Goblin Jailer'
      GoblinJailer.new
    when 'Goblin Swordsman'
      GoblinSwordsman.new
    when 'Goblin Squire'
      GoblinSquire.new  
    when 'Goblin Acolyte'
      GoblinAcolyte.new
    when 'Goblin Mage'
      GoblinMage.new
    when 'Goblin Shaman'
      GoblinShaman.new
    when 'Goblin King'
      GoblinKing.new
    else
      raise "Unknown enemy: #{enemy_id}"
    end
  end
end
