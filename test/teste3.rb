 # Criando alguns itens
    potion = Potion.new("Red Vial", 30)
    knife = Knife.new("Rusty Knife", 15)

    # Adicionando ao inventário
    @inventory.add(potion, 3, :player)
    @inventory.add(knife, 2, :enemy)