##
# Une Sauvegarde permet de sauvegarder l'historique des coups de l'utilisateur sur une grille
# et de sauvegarder ou de récupérer les informations sur l'utilisateur 
#
require 'fileutils'
require_relative '../Niveau/Niveau.rb'

class Sauvegarde

    ##
    # @@nomUtilisateur => nom de l'utilisateur a charger ou sauvegarder
    # @@DirKurokabe => PATH du répertoire "Kurokabe"
    
    ##
    # Constructeur de Sauvegarde
    #
    def Sauvegarde.creer(unNom)
        new(unNom)
    end

    def initialize(unNom)
        @@nomUtilisateur = unNom
        @@DirKurokabe = Dir.pwd[0, Dir.pwd.index("Kurokabe") + 8]


        if (Dir.exist?("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}") == false)
            
            #Création du dossier du nouvel utilisateur
            Dir.mkdir("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}")

            #Création et initialisation du fichier contenant les informations de l'utilisateur
            fInfoUtilisateur = File.new("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}/infosUtilisateur.krkb", "w+")
            fInfoUtilisateur.write("0\n0")
            fInfoUtilisateur.close()

            #Création fichier contenant les chronos des niveaux classé, les étoiles des niveaux aventures et info si fini ou non des niveaux classiques
            fInfoUtilisateur = File.new("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}/infosScore.krkb", "w+")
            fInfoUtilisateur.write("0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0 0 0 0 0 0")
            fInfoUtilisateur.close()

            #Copie du dossier assets/levels dans le dossier du nouvel utilisateur
            Dir.mkdir("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}/levels")
            Dir.mkdir("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}/levels/Aventure")
            Dir.mkdir("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}/levels/classe")
            Dir.mkdir("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}/levels/classique")

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
    def Sauvegarde.sauvInfosUtilisateur(uneLangue, nbEtoiles)
        fInfoUtilisateur = File.open("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}/infosUtilisateur.krkb", "w")
        fInfoUtilisateur.write("#{uneLangue}\n#{nbEtoiles}")
        fInfoUtilisateur.close()
    end

    ##
    # Récupère la langue de l'utilisateur depuis le fichier infoUtilisateur.krkb
    #
    def Sauvegarde.langue()
        fInfoUtilisateur = File.open("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}/infosUtilisateur.krkb", "r")
        langue = fInfoUtilisateur.read.split[0]
        fInfoUtilisateur.close()
        return langue
    end

    ##
    # Récupère le nombre d'étoiles de l'utilisateur depuis le fichier infoUtilisateur.krkb
    #
    def Sauvegarde.nbEtoile()
        fInfoUtilisateur = File.open("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}/infosUtilisateur.krkb", "r")
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
    def Sauvegarde.sauvNiveau(nomUtilisateur, niveau, estFini, nbEtoiles)
        fichier = File.open("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}/levels/#{niveau.mode}/level#{niveau.id}.iml", "w+")
        Marshal.dump(niveau,fichier)
        fichier.close
        
        #Modification du fichier infosScore.krkb si le niveau sauvegardé est fini
        if(estFini == 1)
            if(mode == "classique")
                ligneModif = 0
                valeurModif = estFini
            elsif(mode == "aventure")
                ligneModif = 1
                valeurModif = nbEtoiles
            else
                ligneModif = 2
                valeurModif = niveau.chrono.timer
            end

            fInfoScore = File.open("#{@@DirKurokabe}/profile/#{@@nomUtilisateur}/infosScore.krkb", 'r+')
            lines = fInfoScore.each_line.to_a         

            lines[ligneModif] = ""
            for i in 0..14 do
                if(i == niveau[4, 5].to_i)
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

