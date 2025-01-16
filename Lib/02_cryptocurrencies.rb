#La ou les crypto qui ont la plus grosse valeur.
#La ou les crypto qui ont la plus petite valeur.
#Les devises dont le cours est inférieur à 6000
#La devise la plus chère parmi celles dont le cours est inférieur à 6000.
require_relative ("./crypto.rb")
require_relative ("./value.rb")

crypto_value= crypto.zip(value).to_h
crypto_value.each do |crypto, value|
  crypto_value[crypto] = value.to_f   #convertir en float
end

def show_menu
  puts " === Menu ==="
  puts "1 Quelle crypto a la plus grosse valeur  ?" #crypto_max
  puts "2 Quelle crypto a la plus petite valeur  ?"#crypto_min
  puts "3 Quelle sont les devises dont le cours est inférieur à 6000 "#crypto_filtre
  puts "4 Quelle est la devise la plus chère parmi celles dont le cours est inférieur à 6000. ?"#crypto_max_down
end

def crypto_max(crypto_value)
  crypto_max = [crypto_value.max_by { |crypto, value| value.to_f }]   
  puts "la crypto la plus cher est #{crypto_max} "    
end
def crypto_min(crypto_value)
  crypto_min = [crypto_value.min_by { |crypto, value| value.to_f }] 
  puts "la crypto la mmoins cher est #{crypto_min}"   
end
def crypto_filtre(crypto_value)
  crypto_value.each do |crypto, value|
    crypto_value[crypto] = value.to_f   #convertir en float
    if crypto_value[crypto] <= 6000     #boucle pour trouver triée les valeur inferieur a 6000
      puts " #{crypto} on une valeur inferieur a 6000 "
      end
      
  end 

end
def crypto_max_down(crypto_value)
  crypto_down = crypto_value.select { |_, value| value < 6000 } #crée un hash de crytpo inferieur a 6000
  crypto_max_down= [crypto_down.max_by { |crypto, value| value.to_f }] 
  puts " Dans les crypto dont la valeur est inferieur a 6000 , #{crypto_max_down} est la plus cher "
end 

  # LOGIQUE MENU

choix = nil 
until choix == 0
  show_menu
  print " faite un chiox "
  choix = gets.chomp.to_i

  case choix 
  when 1
    crypto_max(crypto_value)
  when 2
    crypto_min(crypto_value)
  when 3
    crypto_filtre(crypto_value)
  when 4
    crypto_max_down(crypto_value)
  when 0
    puts  "bye bye " 
  else 
    puts " choix invalide"
  end
end 
