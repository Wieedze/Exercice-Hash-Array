require_relative ("./journalist.rb")

#Combien y a-t-il de handle dans cette array ?

total_handle = handle.size
puts" #{total_handle}"

#Quel est le handle le plus court de cette liste ?

shorter_handle = "@jcunniet"  
shortest_handle = handle.first 

handle.each do |handle|
  if handle.length < shortest_handle.length
    shortest_handle = handle
  end
end

puts "Le handle le plus court est #{shortest_handle}."

#Combien y-a-t'il de handle contenant 5 caractères (le @ ne compte pas pour un caractère)

letter_ok = 0

handle.each do |handle|
  handle.delete("@")
  handle.length 

  if handle.length == 5 
    letter_ok += 1
  end
end

puts " il y a #{letter_ok} de handle a 5 lettres "

#Combien commencent par une majuscule (première lettre juste après le @) ?

capital_letter = 0

handle.each do |handle|
  modified_handle=handle.delete("@")
  if modified_handle[0] =~ /[A-Z]/
    capital_letter += 1
  end
end

puts " il y a #{capital_letter} de handle qui commence par une majuscule  "

#Trie la liste de handle par ordre alphabétique.

handle.each do |handle|
  modified_handle=handle.delete("@")  
end

ordre_alphabetique=handle.sort { |a, b| a <=> b }

puts " dans l'ordre alphabetique ma liste est : " 
puts "#{ordre_alphabetique}"

#Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après)

handle.each do |handle|
  modified_handle=handle.delete("@")  
end

ordre_croissant= handle.sort { |a, b| a.length <=> b.length }

puts " Dans l'ordre croissant ma liste est : " 
puts "#{ordre_croissant}"


#Quelle est la position dans l'array de la personne @epenser ?

index=0

handle.each do |handle|

  if handle == "@epenser"
  else 
    index += 1
  end
end

puts " Le compte Epenser est a la #{index} place de la liste " 


#Sors-moi une répartition des handle par taille de ces derniers (nombre de handle avec 1 caractère, nombre de handle avec 2 caractères, nombre de handle avec 3 caractères, etc)

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


#Si tu as bien compris, quand tu lances le script, les réponses aux questions s'affichent sur ton écran de Terminal via des puts. N'hésite pas à ajouter un peu de pep’s à ton programme en écrivant des phrases, en ajoutant des blagues, voir en faisant un menu (pour les plus chauds) où l'utilisateur peut choisir, dans une liste, la question à laquelle le programme va répondre.