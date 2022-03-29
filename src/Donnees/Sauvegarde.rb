##
# Une Sauvegarde permet de sauvegarder l'historique des coups de l'utilisateur sur une grille
# et de sauvegarder ou de récupérer les informations sur l'utilisateur 
#
require 'fileutils'

class Sauvegarde

    ##
    # @nom => nom de l'utilisateur a charger ou sauvegarder
    
    def Sauvegarde.creer(unNom)
        new(unNom)
    end

    def initialize(unNom)
        @nomUtilisateur = unNom

        if (Dir.exist?("../../profile/" + @nomUtilisateur) == false)
            
            #Création du dossier du nouvel utilisateur
            Dir.mkdir("../../profile/#{@nomUtilisateur}")

            #Création et initialisation du fichier contenant les informations de l'utilisateur
            fInfoUtilisateur = File.new("../../profile/#{@nomUtilisateur}/infosUtilisateur.krkb", "w+")
            fInfoUtilisateur.write("0\n0")
            fInfoUtilisateur.close()

            #Création fichier contenant tous les chronos et étoiles de chauqe niveau
            fInfoUtilisateur = File.new("../../profile/#{@nomUtilisateur}/infosScore.krkb", "w+")
            fInfoUtilisateur.write("0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0 0 0 0 0 0")
            fInfoUtilisateur.close()

            #Copie du dossier assets/levels dans le dossier du nouvel utilisateur
            Dir.mkdir("../../profile/#{@nomUtilisateur}/levels")
            Dir.mkdir("../../profile/#{@nomUtilisateur}/levels/aventure")
            Dir.mkdir("../../profile/#{@nomUtilisateur}/levels/classe")
            Dir.mkdir("../../profile/#{@nomUtilisateur}/levels/classique")

            dir_aventure = Dir["../../assets/levels/aventure/*.krkb"]
            dir_classe = Dir["../../assets/levels/classe/*.krkb"]
            dir_classique = Dir["../../assets/levels/classique/*.krkb"]

            dir_aventure.each do |filename|
                name = File.basename(filename)
                dest_folder = "../../profile/#{@nomUtilisateur}/levels/aventure/#{name}"
                FileUtils.cp(filename, dest_folder)
            end

            dir_classe.each do |filename|
                name = File.basename(filename)
                dest_folder = "../../profile/#{@nomUtilisateur}/levels/classe/#{name}"
                FileUtils.cp(filename, dest_folder)
            end

            dir_classique.each do |filename|
                name = File.basename(filename)
                dest_folder = "../../profile/#{@nomUtilisateur}/levels/classique/#{name}"
                FileUtils.cp(filename, dest_folder)
            end
        end 
    end

    private_class_method :new

    ##
    # [Sauvegarde les informations sur l'utilisateur]
    #
    # === Attributes ===
    #
    # UnString- Le nom de L'utilisateur 
    # uneLangue- la langue choisie par l'utilisateur 
    # nbEtoiles- le nombre d'etoiles que l'utilisateur 
    def sauvInfosUtilisateur(uneLangue, nbEtoiles)
        fInfoUtilisateur = File.open("../../profile/#{@nomUtilisateur}/infosUtilisateur.krkb", "w")
        fInfoUtilisateur.write("#{uneLangue}\n#{nbEtoiles}")
        fInfoUtilisateur.close()
    end

    def langue()
        fInfoUtilisateur = File.open("../../profile/#{@nomUtilisateur}/infosUtilisateur.krkb", "r")
        return fInfoUtilisateur.read.split[0]
    end

    #retourne
    def nbEtoile()
        fInfoUtilisateur = File.open("../../profile/#{@nomUtilisateur}/infosUtilisateur.krkb", "r")
        return fInfoUtilisateur.read.split[1]
    end

    #Sauvegarde l'historique des coups du niveau en cours
    def sauvNiveau(niveau, grille, listCoup, chrono, estFini, nbEtoiles)
        for i in 0..grille.length do 
            for j in 0..grille[0].length do
                sauvLigneGrille = sauvLigneGrille.concat(grille[i][j])
            end
        end
        fGrille = File.open("../../profile/#{@nomUtilisateur}/levels/#{niveau}", "w")
        fGrille.write("#{grille.length}\n#{grille[0].length}\n#{sauvLigneGrille}")
    end
end # Marqueur de fin de classe

sauvegarde = Sauvegarde.creer("Jeremy");
sauvegarde.sauvInfosUtilisateur(1, 15);

print(sauvegarde.langue() + "\n");
print(sauvegarde.nbEtoile() + "\n");