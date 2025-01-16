require_relative ("./journalist.rb")


def show_menu
  puts " === Menu ==="
  puts "1 Combien y a-t-il de handle dans cette array ?" #number_handle
  puts "2 Quel est le handle le plus court de cette liste ?"#hortest_handle
  puts "3 Combien y-a-t'il de handle contenant 5 caractères "#letter_ok
  puts "4 Combien commencent par une majuscule (première lettre juste après le @) ?"#capital_letter
  puts "5 Trie la liste de handle par ordre alphabétique."#ordre_alphabetique
  puts "6 Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après)"#croissant
  puts "7 Quelle est la position dans l'array de la personne @epenser ?"#position
  puts "8 Sors-moi une répartition des handle par taille de ces derniers "#length

end

#Methode pour fonctionalité

def number_handle

  total_handle = handle.size
 puts" #{total_handle}"

end

def shortest_handle

  shorter_handle = "@jcunniet"  
  shortest_handle = handle.first 
  
  handle.each do |handle|
    if handle.length < shortest_handle.length
      shortest_handle = handle
    end
  end
  
  puts "Le handle le plus court est #{shortest_handle}."

end

def letter_ok
  letter_ok = 0

 handle.each do |handle|
  handle.delete("@")
  handle.length 

  if handle.length == 5 
    letter_ok += 1
  end
 end

 puts " il y a #{letter_ok} de handle a 5 lettres "
  
end

def capital_letter
  capital_letter = 0

  handle.each do |handle|
    modified_handle=handle.delete("@")
    if modified_handle[0] =~ /[A-Z]/
      capital_letter += 1
    end
  end
  
  puts " il y a #{capital_letter} de handle qui commence par une majuscule  "

end

def ordre_alphabetique
  handle.each do |handle|
    modified_handle=handle.delete("@")  
  end
  
  ordre_alphabetique=handle.sort { |a, b| a <=> b }
  
  puts " dans l'ordre alphabetique ma liste est : " 
  puts "#{ordre_alphabetique}"
end

def croissant
  handle.each do |handle|
    modified_handle=handle.delete("@")  
  end
  
  ordre_croissant= handle.sort { |a, b| a.length <=> b.length }
  
  puts " Dans l'ordre croissant ma liste est : " 
  puts "#{ordre_croissant}"
end

def position
  index=0

  handle.each do |handle|

  if handle == "@epenser"
  else 
    index += 1
  end
  end
  puts " Le compte Epenser est a la #{index} place de la liste "  

end

def length
  max_length = 0

  handle.each do |h|

  handle_without_at = h.delete("@")
  max_length = [max_length, handle_without_at.length].max
  end

  puts "Max length: #{max_length}"

  # Initialiser le tableau de répartition des tailles
  length = Array.new(max_length, 0) # Crée un tableau de taille max_length avec des zéros

  #puts "Initial length array: #{length.inspect}"

  # Compter les occurrences de chaque taille
  handle.each do |h|
  handle_without_at = h.delete("@")
  taille = handle_without_at.length
  length[taille - 1] += 1 # Incrémente le compteur pour la taille correspondant à la longueur
  end

  puts "Répartition des tailles : #{length.inspect}"
end

# LOGIQUE MENU

choix = nil 
until choix == 0
  show_menu
  print " faite un chiox "
  choix = gets.chomp.to_i

  case choix 
  when 1
    number_handle
  when 2
    shortest_handle
  when 3
    letter_ok
  when 4
    capital_letter
  when 5
    ordre_alphabetique
  when 6
    croissant
  when 7
    position
  when 8
    lentgth
  when 0
    puts  "bye bye " 
  else 
    puts " choix invalide"
  end
end 

