# 📖 Grimoire of the Terminal

*The forbidden tome of knowledge for the accursed soul who dares master the Ruby arts.*

---

## 🩸 Bloodline: Project Origins

**Project Name:** Bloodlines of the Terminal\
**Purpose:** A command-line RPG, forged in the shadows, where combat flows like cursed ink and characters inherit powers through dark lineage.

### 🧬 Core Classes

- ``: The ancient blood from which all warriors and mages descend.
- ``: Rage-fed berserker, empowered by raw strength.
- ``: Caster of charm and intellect, whose arcane arts dance on the brink of madness.

### 🧱 Hierarchy & Inheritance

- `Warrior < Character`
- `Mage < Character`

These classes inherit vital stats and dark methods from `Character`.

### 🧩 Mixins (To Be Summoned)

- Modules shall be invoked when shared traits emerge, awaiting their moment.

---

## 🔮 Arcane Ruby Concepts

### 🧠 Object Orientation

- All is an object — from numbers to classes to the abyss itself.
- `self` binds you to your current vessel.

### ⚔️ Blocks, Procs, and Lambdas

- **Blocks**: Anonymous rituals, passed into methods, invoked with `yield` or `.call`
- **Procs**: Encapsulated spells (`Proc.new {}`) that share the fate of their summoner (`return` exits the outer method!)
- **Lambdas**: Disciplined spirits (`-> {}`) that keep to their own realm, verifying arguments strictly.

### 💀 Method Magic

```ruby
def summon_doom(name = 'Nameless')
  puts "The darkness greets you, #{name}."
end
```

- Keyword arguments: `def forge(name:, weapon:)`
- Variable args: `*souls` (array), `**artifacts` (hash)

### ✨ Attribute Spells

```ruby
attr_accessor :rage
```

Summons both reader and writer methods for your variables. Choose wisely:

- `attr_reader`: one who sees
- `attr_writer`: one who alters

---

## 🧟 Combat Ritual

```ruby
def combat(player, enemy)
  while player.alive? && enemy.alive?
    # Player chooses action
    # Attack sequence
    # Enemy retaliation
  end

  puts player.alive? ? "#{player.name} is victorious!" : "#{player.name} has fallen..."
end
```

---

## 🧾 Commit Scrolls (So Far)

- **"Add character loader, fix Mage intelligence bug, extract combat method, and add learning.txt"**
- *Translation:* Bound the scrolls: summoned character loader, corrected the Mage's arcane power, forged combat rituals into method, and etched learnings into the codex.

---

## 📓 Tome of Learning (learning.txt)

- Recapitulations of Ruby dark arts.
- Topics include: `self`, `yield`, `attr_accessor`, method arcanum, etc.

---

## 🏰 What's Next?

-

---

☠️ *Only those willing to bleed with their code may survive this grimoire.*

