class Rat < Character
  attr_accessor  :rage
  def initialize(name: 'Rat', hp: 80, attack: 8, defense: 5)
    super(name: name, hp: hp, attack: attack, defense: defense)
    @rage = 0
  end

  def attack_target(target)
    puts 'Bites!'
  
    if @rage > 20
      base = @attack * 3
      puts "#{@name} bites with rage!"
      @rage = 0
    else
      base = @attack + 5
      @rage += 10
    end
  
    apply_damage(target, base)
  end
end