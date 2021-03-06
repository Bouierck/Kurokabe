require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'
require_relative '../../Niveau/CaseCliquable.rb'

##
# Les chiffres entourés de murs doivent sortir
#
class IslandExp < Technique
    
    public_class_method :new
    
    def initialize
        super(Langue.text("IslandExp"), Langue.text("IslandExpDesc"))
    end 

    def verifieTech(grille)
        #On parcourt toutes les cases de la grille
        grille.matrice.each do |line|
            line.each do |c|

                @casesChange = []

                #Si la case est un chiffre et a qu'une sortie possible à l'état 0, alors on peut la compléter par un point
                if(c.is_a?(CaseChiffre) && c.chiffre > 1)

                    count = 0

                    #gauche
                    if c.x <= 0 || grille.matrice[c.y][c.x - 1].etat == TypeCase::MUR
                        count += 1
                    elsif grille.matrice[c.y][c.x - 1].etat == TypeCase::VIDE
                        @casesChange << grille.matrice[c.y][c.x - 1] #Potentiel expension
                    end

                    #droite
                    if c.x >= (grille.matrice.length - 1) || grille.matrice[c.y][c.x + 1].etat == TypeCase::MUR
                        count += 1
                    elsif grille.matrice[c.y][c.x + 1].etat == TypeCase::VIDE
                        @casesChange << grille.matrice[c.y][c.x + 1]
                    end
                    
                    #haut
                    if c.y <= 0 || grille.matrice[c.y - 1][c.x].etat == TypeCase::MUR
                        count += 1
                    elsif grille.matrice[c.y - 1][c.x].etat == TypeCase::VIDE
                        @casesChange << grille.matrice[c.y - 1][c.x]
                    end

                    #bas
                    if c.y >= (grille.matrice.length - 1) || grille.matrice[c.y + 1][c.x].etat == TypeCase::MUR
                        count += 1
                    elsif grille.matrice[c.y + 1][c.x].etat == TypeCase::VIDE
                        @casesChange << grille.matrice[c.y + 1][c.x]
                    end
                    
                    #Une seul sortie possible && on a trouvé une case vide sans point
                    return true if count == 3 && @casesChange.empty? == false

                end

            end
        end

        return false

    end

end