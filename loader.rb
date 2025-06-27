# Preload base classes to prevent load order issues (must come before Dir[])
require_relative './items/item'
require_relative './characters/character'

Dir["./characters/**/*.rb"].each { |f| require_relative f }
Dir["./items/**/*.rb"].each { |f| require_relative f }
Dir["./inventory/**/*.rb"].each { |f| require_relative f }
