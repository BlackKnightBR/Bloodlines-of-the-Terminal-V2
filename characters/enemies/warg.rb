class Warg < Character
  attr_accessor :rage

  def initialize(name: 'Warg', hp: 160, attack: 18, defense: 12, level: 4, xp_given: 120)
    super(name: name, hp: hp, attack: attack, defense: defense, level: level, xp_given: xp_given)
    @rage = 0
  end

  def attack_target(target)
    puts "#{@name}'s eyes glow with savage hunger as it circles you with a low growl..."

    if @rage > 20
      base = @attack * 3
      puts "#{@name} unleashes a blood-soaked roar and tears into your flesh with monstrous jaws!"
      @rage = 0
    else
      base = @attack + 5
      @rage += 10
    end

    apply_damage(target, base)
  end
end