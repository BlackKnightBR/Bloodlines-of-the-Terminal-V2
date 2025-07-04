class GoblinShaman < Character
  attr_accessor :haste, :mana, :attack_buff_turns

  def initialize(name: 'Goblin Shaman', hp: 130, attack: 12, defense: 18, level: 10, xp_given: 300)
    super(name: name, hp: hp, attack: attack, defense: defense, level: level, xp_given: xp_given)
    @haste = 0
    @mana = 50
    @attack_buff_turns = 0
  end

  def attack_target(target)
    if @attack_buff_turns > 0
      effective_attack = @attack + 5
      @attack_buff_turns -= 1
      puts "#{@name} glows with lingering spirit energy! (+5 attack, #{@attack_buff_turns} turns left)"
    else
      effective_attack = @attack
    end

    puts "#{@name} whispers to the shadows, channeling forbidden power..."

    if @haste >= 120
      # Ritual completo: ataque devastador
      damage = effective_attack * 5
      puts "#{@name}'s eyes roll back as dark flame erupts from his staff! 🔥"
      @haste = 0
      apply_damage(target, damage)

    elsif @mana >= 20 && @attack_buff_turns == 0 && rand < 0.3
      # Buff espiritual
      @mana -= 20
      @attack_buff_turns = 3
      puts "#{@name} invokes the ancestral spirits — his form pulses with eldritch energy!"
      @haste += 15

    elsif @mana >= 15 && rand < 0.4
      # Cura ritualística
      heal = rand(20..35)
      @mana -= 15
      @hp += heal
      puts "#{@name} marks blood runes in the air and regains #{heal} HP!"
      @haste += 10

    elsif @haste >= 60
      # Preparação final
      puts "#{@name} begins etching dark runes into the ground — power is close..."
      @haste += 30

    elsif @haste >= 30
      # Preparação intermediária
      puts "#{@name} chants a fractured hymn, weaving unstable energy."
      @haste += 25

    else
      # Ataque padrão
      damage = effective_attack + rand(3..7)
      puts "#{@name} lunges with his ritual dagger, darkness trailing the blade!"
      @haste += 20
      apply_damage(target, damage)
    end
  end
end