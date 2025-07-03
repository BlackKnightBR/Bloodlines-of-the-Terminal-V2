class Character
  attr_accessor :name, :hp, :attack, :defense, :type, :xp, :level, :xp_given

  def initialize(name:'Douche', hp:100, attack:10, defense:15, type:'creature', level: 1, xp_given: 100)
    @name = name
    @hp = hp
    @attack = attack
    @defense = defense
    @type = type
    @xp = 0
    @level = level
    @xp_given = xp_given
  end

  def xp_needed
    100 + (@level * 50)
  end

  def gain_xp(amount)
    @xp += amount
    while @xp >= xp_needed
      @xp -= xp_needed
      @level += 1
      @hp += 10
      @attack += 2
      @defense += 1
      puts "-" * 40
      puts "Your stats have increased!"
      puts "#{@name} leveled up! Now level #{@level}!"
      status
      puts "-" * 40
    end
  end

  def attack_target(target)
    puts "#{@name} attacks!"
    apply_damage(target, @attack)
  end

  def take_damage(amount)
    @hp -= amount
    @hp = 0 if @hp < 0
  end

  def alive? = @hp > 0

  def status
    puts "-" * 40
    puts "#{@name}'s Status:"
    puts "HP: #{@hp}"
    puts "Attack: #{@attack}"
    puts "Defense: #{@defense}"
    puts "XP: #{@xp}/#{xp_needed}"
    puts "Level: #{@level}"
    puts "-" * 40
  end

  def skill_move(target)
    puts "#{@name} is but a mortal shell, powerless to summon forbidden wrath..."
  end

  protected

  def apply_damage(target, base_damage)
    damage = base_damage - target.defense
    damage = 0 if damage < 0
    target.take_damage(damage)
    puts "#{target.name} takes #{damage} damage!"
  end
end