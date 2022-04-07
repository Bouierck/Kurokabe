##
# Une Sauvegarde permet de sauvegarder l'avancée de l'utilisateur dans les différents niveaux ou 
# de sauvegarder les infos concernant l'utilisateur
#
require 'fileutils'

require_relative '../Niveau/Niveau.rb'
require_relative '../Niveau/Score.rb'

class Sauvegarde

    ##
    # @@nomUtilisateur => nom de l'utilisateur a charger ou sauvegarder
    # @@DirKurokabe => PATH du répertoire "Kurokabe"
    
    ##
    # Constructeur de Utilisateur
    #
    # ==== Attributes
    #
    # * -nom- nom de l'utilisateur
    # * -langue- langue chois par l'utilisateur
    #
    def Sauvegarde.creer(unNom)
        new(unNom)
    end

    def initialize(unNom)
        @@nomUtilisateur = unNom
        @@DirKurokabe = __dir__

        if (Dir.exist?("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}") == false)
            
            #Création du dossier du nouvel utilisateur
            Dir.mkdir("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}")

            #Création et initialisation du fichier contenant les informations de l'utilisateur
            fInfoUtilisateur = File.new("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}/infosUtilisateur.krkb", "w+")
            fInfoUtilisateur.write("0\n0")
            fInfoUtilisateur.close()

            #Création fichier contenant les chronos des niveaux classé, les étoiles des niveaux aventures et info si fini ou non des niveaux classiques
            fInfoUtilisateur = File.new("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}/infosScore.krkb", "w+")
            fInfoUtilisateur.write("0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0 0 0 0 0 0")
            fInfoUtilisateur.close()

            #Copie du dossier assets/levels dans le dossier du nouvel utilisateur
            Dir.mkdir("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}/levels")
            Dir.mkdir("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}/levels/Aventure")
            Dir.mkdir("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}/levels/Classe")
            Dir.mkdir("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}/levels/Classique")

        end 
    end

    private_class_method :new

    ##
    # Sauvegarde les informations sur l'utilisateur
    #
    # === Attributes ===
    #
    # * -uneLangue- la langue choisie par l'utilisateur 
    #
    def Sauvegarde.sauvInfosUtilisateur(uneLangue)
        fInfoUtilisateur = File.open("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}/infosUtilisateur.krkb", "w")
        fInfoUtilisateur.write("#{uneLangue}")
        fInfoUtilisateur.close()
    end

    ##
    # Récupère la langue de l'utilisateur depuis le fichier infoUtilisateur.krkb
    #
    def Sauvegarde.langue()
        fInfoUtilisateur = File.open("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}/infosUtilisateur.krkb", "r")
        langue = fInfoUtilisateur.read.split[0]
        fInfoUtilisateur.close()
        return langue
    end

    ##
    # Sauvegarde les informations d'un niveau + modifie infosScore.krkb si le niveau est fini
    #
    # === Attributes ===
    #
    # * -nomUtilisateur- Nom de l'utilisateur (dossier de sauvegarde)
    # * -niveau- L'objet Niveau a sauvegardé
    # * -nbEtoiles- Le nombre d'étoiles récupérés sur le niveau
    #
    def Sauvegarde.sauvNiveau(nomUtilisateur, niveau, nbEtoiles)
        fichier = File.open("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}/levels/#{niveau.mode}/level#{niveau.id}.krkb", "w+")
        Marshal.dump(niveau,fichier)
        fichier.close
        
        #Modification du fichier infosScore.krkb si le niveau sauvegardé est fini
        if(niveau.grille.estFini? == true)
            if(niveau.mode == "Classique")
                ligneModif = 0
                valeurModif = 0
                valeurModif = 1 if niveau.grille.estFini?
            elsif(niveau.mode == "Aventure")
                ligneModif = 1
                valeurModif = Score.calculer(niveau.resolveur.nbAppel, niveau.chrono.timer, (niveau.id-1/5) + 1)
            else
                ligneModif = 2
                valeurModif = niveau.chrono.timer
            end

            #Ouverture du fichier de score
            fInfoScore = File.open("#{@@DirKurokabe}/../../profile/#{@@nomUtilisateur}/infosScore.krkb", 'r+')
            lines = fInfoScore.read.split("\n")

            #Modification de la valeur de score
            lines[ligneModif] = lines[ligneModif].split(' ')
            lines[ligneModif][niveau.id.to_i - 1] = valeurModif.to_s
            lines[ligneModif] = lines[ligneModif].join(' ')

            fInfoScore.rewind() #remise du curseur en haut du fichier
            fInfoScore.write(lines.join("\n"))
            fInfoScore.close()
        end
    end
end # Marqueur de fin de classe

