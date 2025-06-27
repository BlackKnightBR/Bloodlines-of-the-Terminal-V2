class Character
  attr_accessor :name, :hp, :attack, :defense, :type

  def initialize(name:'Douche', hp:100, attack:10, defense:15, type:'creature')
    @name = name
    @hp = hp
    @attack = attack
    @defense = defense
    @type = type
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