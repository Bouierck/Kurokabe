require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'
require_relative '../../Niveau/CaseCliquable.rb'

class IslandContinuity < Technique

    def initialize
        super("Expansion d'ilot", "Les points entourés de murs peuvent forcément s'étendre")
    end 

    def verifieTech

        @casesChange = []

        #Si la case est une case cliquable à l'état POINT et a qu'une sortie possible à l'état 0, alors on peut la compléter par un point
        @grille.matrice.each do |line|
            line.each do |c|
                if(c.is_a?(CaseCliquable) && c.etat == TypeCase::POINT)
                    if c.x <= 0 || grille.matrice[c.y][c.x - 1].etat == TypeCase::MUR
                        count += 1
                    elsif grille.matrice[c.y][c.x - 1].etat == TypeCase::VIDE
                        @casesChange << grille.matrice[c.y][c.x - 1]
                    end

                    if c.x >= (grille.matrice.length - 1) || grille.matrice[c.y][c.x + 1].etat == TypeCase::MUR
                        count += 1
                    elsif grille.matrice[c.y][c.x + 1].etat == TypeCase::VIDE
                        @casesChange << grille.matrice[c.y][c.x + 1]
                    end
                    
                    if c.y <= 0 || grille.matrice[c.y - 1][c.x].etat == TypeCase::MUR
                        count += 1
                    elsif grille.matrice[c.y - 1][c.x].etat == TypeCase::VIDE
                        @casesChange << grille.matrice[c.y - 1][c.x]
                    end

                    if c.y >= (grille.matrice.length - 1) || grille.matrice[c.y + 1][c.x].etat == TypeCase::MUR
                        count += 1
                    elsif grille.matrice[c.y + 1][c.x].etat == TypeCase::VIDE
                        @casesChange << grille.matrice[c.y + 1][c.x]
                    end

                    return true if count == 3 && @casesChange.empty? == false
                end
            end
        end

        return false
    end
end