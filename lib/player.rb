class Player
    attr_accessor :name, :life_points
   
    def initialize(name)
        @name = name
        @life_points = 10
      end
    
    def show_state
        if @life_points <= 0
            puts "#{@name} a 0 points de vie"
        elsif
            puts "#{@name} a #{@life_points} points de vie"
        end
    end

    def gets_damage(damage_received)
        @life_points = @life_points - damage_received
        if @life_points <= 0
        puts " le joueur #{@name} a été tué !"
        end
    end

    def attacks(player_attacked)
        damage = compute_damage
        puts "le joueur #{@name} attaque le joueur #{player_attacked.name}"
        puts "il lui inflige #{damage} points de dommages"
        player_attacked.gets_damage(damage)
    end 

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer
    attr_accessor :name, :life_points, :weapon_level
    
    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
      end
      
    def show_state
        if @life_points <= 0
            puts "#{@name} a 0 points de vie"
        elsif
            puts "#{@name} a #{@life_points} points de vie"
        end
    end
    def show_state_weapon
        if @weapon_level <= 0
            puts "#{@name} a 0 niveau d'arme"
        elsif
            puts "#{@name} a #{@weapon_level} niveau d'arme"
        end
    end

    def gets_damage(damage_received)
        @life_points = @life_points - damage_received
        if @life_points <= 0
        puts " le joueur #{@name} a été tué !"
        end
    end

    def attacks(player_attacked)
        damage = compute_damage
        puts "le joueur #{@name} attaque le joueur #{player_attacked.name}"
        puts "il lui inflige #{damage} points de dommages"
        player_attacked.gets_damage(damage)
    end 
    
    def search_weapon
        new_weapon = compute_damage_2
        puts "tu a trouvé une arme de niveau #{new_weapon}"
        if new_weapon > @weapon_level
            @weapon_level = new_weapon
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        elsif new_weapon < @weapon_level
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end

    end

    def search_health_pack
        new_health_pack = compute_damage_2
        if new_health_pack == 1 
        puts "Tu n'as rien trouvé... "
        end  
        if new_health_pack <= 5   
            @life_points += 50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        end 
        if new_health_pack == 6 
            @life_points += 80
        
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end

    end

    def compute_damage_2
        rand(1..6)
    end
    
    def compute_damage
        rand(1..6) * @weapon_level
    end

end


