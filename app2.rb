require 'pry'

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "  ------------------------------------------------
\n |Bienvenue sur 'ILS VEULENT TOUS MA POO' !       |\n
 |Le but du jeu est d'être le dernier survivant ! |\n
--------------------------------------------------"

puts "quel est votre prenom"
print "> "
player_name = gets.chomp
#on affiche les noms des joueurs 
print "\n"
human_player = HumanPlayer.new(player_name)
player1 = Player.new("Josiane")
player2 = Player.new("José")
#on affiche leurs etat de santé
enemies = [player1, player2]
puts "Voici l'état de nos joueurs :"
human_player.show_state
player1.show_state
player2.show_state
print "\n"
#boucle pour deffinir les limites du jeu
while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
#demande d'action
puts "Quelle action veux-tu effectuer ?"
puts "- a - chercher une meilleure arme
- s - chercher à se soigner"
print "> "
action = gets.chomp
print "\n"
#execution de l'action
if action == "a"
    human_player.search_weapon
elsif action == "s"
    human_player.search_health_pack
end
#afficher l'etat de santé des enemies
puts "attacker un joueur en vue : "
puts "- 0 - #{player1.show_state}"
puts "- 1 - #{player2.show_state}"
#demande d'action
print "> "
print "\n"
action2 = gets.chomp
#execution de l'action
if action2 == "0"
    human_player.attacks(player1)
elsif action2 == "1"
    human_player.attacks(player2)
end
print "\n"
#afficher l'etat de santé des enemies
enemies.each do |p|
    p.show_state
end

puts " cliquer sur entrer pour voir la reposte"
print "> "
action = gets.chomp


puts "Les autres joueurs t'attaquent !\n"


enemies.each do |riposte|
    riposte.attacks(human_player)
    if player1.life_points <= 0 || player2.life_points <= 0
        break
    end
    end
print "\n"


if player1.life_points <= 0 || player2.life_points <= 0
    break
end
puts "Voici l'état de nos joueurs :"
human_player.show_state
player1.show_state
player2.show_state
print "\n"

if human_player.life_points <= 0 
    puts "Loser ! Tu as perdu !"
else 
    puts "BRAVO ! TU AS GAGNE !"
end
end
