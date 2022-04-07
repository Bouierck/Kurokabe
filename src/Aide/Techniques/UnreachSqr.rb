require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'
require_relative '../../Niveau/CaseCliquable.rb'

##
# Technique qui consiste à remplacer par des cases noires les cases inateignables par un chiffre
class UnreachSqr < Technique

    public_class_method :new

    def initialize
        
        super(Langue.text("UnreachSqr"), Langue.text("UnreachSqrDesc"))
 
    end

    def verifieTech(grille)

        file = Queue.new #File stock les cases du parcours
        atteignable = [] #Stock les cases atteignables de la grille

        grille.matrice.each do |line|
            line.each do |c|

                @casesChange = []

                if(c.is_a?(CaseChiffre))
                    
                    n = c.chiffre - 1 #nombre de déplacement possible
                    file << [c, n]    #Stock la case et le nombre de déplacement
                    
                    while(file.empty? == false)

                        prof = file.pop
                        if(prof[1] > 0)
                            ca = prof[0] #case actuelle
                            ns = prof[1] - 1 #deplacement possible pour les prochaines cases

                            if(ca.x > 0 && grille.matrice[ca.y][ca.x - 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x - 1].etat != TypeCase::MUR)

                                if(atteignable.include?(grille.matrice[ca.y][ca.x - 1]) == false) #Case de gauche pas un mur et pas déjà atteignable
                                    file << [grille.matrice[ca.y][ca.x - 1], ns]                  #ajout de la case dans la file
                                    atteignable << grille.matrice[ca.y][ca.x - 1]                 #case atteignable
                                end

                            end
                            if(ca.y > 0 && grille.matrice[ca.y - 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y - 1][ca.x].etat != TypeCase::MUR)

                                if(atteignable.include?(grille.matrice[ca.y - 1][ca.x]) == false) #Case d'en haut
                                    file << [grille.matrice[ca.y - 1][ca.x], ns]
                                    atteignable << grille.matrice[ca.y - 1][ca.x]
                                end

                            end
                            if(ca.x < (grille.matrice.length - 1)  && grille.matrice[ca.y][ca.x + 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x + 1].etat != TypeCase::MUR)

                                if(atteignable.include?(grille.matrice[ca.y][ca.x + 1]) == false) #Case de droite
                                    file << [grille.matrice[ca.y][ca.x + 1], ns]
                                    atteignable << grille.matrice[ca.y][ca.x + 1]
                                end

                            end
                            if(ca.y < (line.length - 1) && grille.matrice[ca.y + 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y + 1][ca.x].etat != TypeCase::MUR)                    

                                if(atteignable.include?(grille.matrice[ca.y + 1][ca.x]) == false) #Case d'en bas
                                    file << [grille.matrice[ca.y + 1][ca.x], ns]
                                    atteignable << grille.matrice[ca.y + 1][ca.x]
                                end

                            end
                        end

                    end

                end

            end
        end

        #Récupération des cases non atteignable
        @casesChange = grille.matrice.flatten.reduce([]) { |nonAtteignable, c|
            nonAtteignable << c if atteignable.include?(c) == false && c.is_a?(CaseCliquable) && c.etat != TypeCase::MUR
            nonAtteignable
        }

        return true if @casesChange.empty? == false
        return false

    end

end