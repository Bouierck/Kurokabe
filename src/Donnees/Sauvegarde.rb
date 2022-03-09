##
# Une Sauvegarde permet de sauvegarder l'historique des coups de l'utilisateur sur une grille
# et de sauvegarder ou de récupérer les informations sur l'utilisateur 
#
require 'fileutils'

class Sauvegarde

    ##
    # @nom => nom de l'utilisateur a charger ou sauvegarder
    
    def initialize(unNom)
        if File.exist?('../../Profile/' + unNom + '.dump') == false
            my_dir = Dir["../../assets/levels"]
            my_dir.each do |filename| 
              FileUtils.cp(filename, "C:/Documents and Settings/user/Desktop/destinationfolder/****/" + File.basename(filename, ".doc"))
            end
    end

    ##
    # [Sauvegarde les informations sur l'utilisateur]
    #
    # === Attributes ===
    #
    # UnString- Le nom de L'utilisateur 
    # uneLangue- la langue choisie par l'utilisateur 
    # nbEtoiles- le nombre d'etoiles que l'utilisateur 
    def sauvInfosUtilisateur(unString, uneLangue, nbEtoiles)
        file = File.open(chemin, "r+")
        file.write(unString + "\n" + uneLangue.to_s + "\n" + nbEtoiles.to_s)
        file.close
    end

    def creer()
        if file == nil 
            file = File.new()
        end
    end 

    #Retourn le pseudo de l'utilisateur
    def pseudo()
        file = File.open(chemin, "r")
    end

    #retourne
    def nbEtoile()
        file = File.open(chemin, "r")
    end

    def langue()
        file = File.open(chemin, "r")
    end

    #Sauvegarde l'historique des coups du niveau en cours
    def sauvHistorique()
        
    end
end # Marqueur de fin de classe
