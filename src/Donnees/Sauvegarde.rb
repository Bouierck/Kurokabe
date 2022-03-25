##
# Une Sauvegarde permet de sauvegarder l'historique des coups de l'utilisateur sur une grille
# et de sauvegarder ou de récupérer les informations sur l'utilisateur 
#
require 'fileutils'

class Sauvegarde

    ##
    # @nom => nom de l'utilisateur a charger ou sauvegarder
    
    ##
    # Constructeur de Sauvegarde
    #
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

            #Création fichier contenant les chronos des niveaux classé, les étoiles des niveaux aventures et info si fini ou non des niveaux classiques
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
    # Sauvegarde les informations sur l'utilisateur
    #
    # === Attributes ===
    #
    # uneLangue- la langue choisie par l'utilisateur 
    # nbEtoiles- le nombre d'etoiles que l'utilisateur 
    def sauvInfosUtilisateur(uneLangue, nbEtoiles)
        fInfoUtilisateur = File.open("../../profile/#{@nomUtilisateur}/infosUtilisateur.krkb", "w")
        fInfoUtilisateur.write("#{uneLangue}\n#{nbEtoiles}")
        fInfoUtilisateur.close()
    end

    ##
    # Récupère la langue de l'utilisateur depuis le fichier infoUtilisateur.krkb
    #
    def langue()
        fInfoUtilisateur = File.open("../../profile/#{@nomUtilisateur}/infosUtilisateur.krkb", "r")
        langue = fInfoUtilisateur.read.split[0]
        fInfoUtilisateur.close()
        return langue
    end

    ##
    # Récupère le nombre d'étoiles de l'utilisateur depuis le fichier infoUtilisateur.krkb
    #
    def nbEtoile()
        fInfoUtilisateur = File.open("../../profile/#{@nomUtilisateur}/infosUtilisateur.krkb", "r")
        nbEtoiles = fInfoUtilisateur.read.split[1]
        fInfoUtilisateur.close()
        return nbEtoiles
    end

    ##
    # Sauvegarde les informations d'un niveau + modifie infosScore.krkb si le niveau est fini
    #
    # === Attributes ===
    #
    # mode- Le mode du niveau ("aventure", "classe", "classique") 
    # niveau- Le nom du niveau
    # grille- La grille du niveau
    # listCoup- L'historique de coup du niveau
    # chrono- Le chrono en seconde du niveau (-1 si pas de chrono dans le niveau)
    # estFini- Indication si le niveau est fini (1 si fini, 0 si pas fini) 
    # nbEtoiles- Le nombre d'étoiles récupérés sur le niveau (-1 si pas de système d'étoiles dans le niveau)
    def sauvNiveau(mode, niveau, grille, listCoup, chrono, estFini, nbEtoiles)
        sauvLigneGrille, sauvListCoup = "", ""
        
        grille.each{|t| t.each{|e| sauvLigneGrille = sauvLigneGrille.concat(e.to_s, " ")}}
        listCoup.each{|e| sauvListCoup = sauvListCoup.concat(e.to_s, " ")}
        
        fNiveau = File.open("../../profile/#{@nomUtilisateur}/levels/#{mode}/#{niveau}.krkb", "w")
        fNiveau.write("#{grille.length}\n#{grille[0].length}\n#{sauvLigneGrille}\n#{sauvListCoup}\n#{chrono}\n#{estFini}\n#{nbEtoiles}")
        fNiveau.close()
        if(estFini == 1)
            if(mode == "aventure")
                ligneModif = 0
                valeurModif = nbEtoiles
            elsif(mode == "classique")
                ligneModif = 1
                valeurModif = estFini
            else
                ligneModif = 2
                valeurModif = chrono
            end

            fInfoScore = File.open("../../profile/#{@nomUtilisateur}/infosScore.krkb", 'r+')
            lines = fInfoScore.each_line.to_a         

            lines[ligneModif] = ""
            for i in 0..14 do
                if(i == niveau.to_i - 1)
                    lines[ligneModif] = lines[ligneModif].concat(valeurModif.to_s, " ")
                else
                    lines[ligneModif] = lines[ligneModif].concat("0 ")
                end    
            end
            lines[ligneModif] = lines[ligneModif].concat("\n")

            fInfoScore.rewind
            fInfoScore.write(lines.join)
            fInfoScore.close()
        end
    end
end # Marqueur de fin de classe

sauvegarde = Sauvegarde.creer("Jeremy");
sauvegarde.sauvInfosUtilisateur(1, 15);

print(sauvegarde.langue() + "\n");
print(sauvegarde.nbEtoile() + "\n");

grille = Array.new(3) { Array.new(3) }
grille[0][0] = 1
grille[0][1] = 2
grille[0][2] = 3
grille[1][0] = 4
grille[1][1] = 5
grille[1][2] = 6
grille[2][0] = 7
grille[2][1] = 8
grille[2][2] = 9

listCoup = Array.new(3) { Array.new(2) }
listCoup[0][0] = 1
listCoup[0][1] = 2
listCoup[1][0] = 4
listCoup[1][1] = 5
listCoup[2][0] = 7
listCoup[2][1] = 8

sauvegarde.sauvNiveau("aventure", "1", grille, listCoup, -1, 1, 2)