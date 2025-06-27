class Item
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def use(target)
    raise NotImplementedError, "This item has no defined use!"
  end
end