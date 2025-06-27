puts "Arquivos carregados:"
Dir["./characters/**/*.rb"].each { |f| puts f }
