class Wolf < Character
  attr_accessor :rage

  def initialize(name: 'Dire Wolf', hp: 120, attack: 12, defense: 10, level: 3, xp_given: 80)
    super(name: name, hp: hp, attack: attack, defense: defense, level: level, xp_given: xp_given)
    @rage = 0
  end

  def attack_target(target)
    puts "#{@name} snarls and lunges, fangs bared and eyes blazing!"

    if @rage > 20
      base = @attack * 3
      puts "#{@name} howls with primal fury and sinks its fangs deep into your flesh!"
      @rage = 0
    else
      base = @attack + 5
      @rage += 10
    end

    apply_damage(target, base)
  end
end