require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'
require_relative '../../Niveau/CaseCliquable.rb'

class Island < Technique

    public_class_method :new

    def initialize
        super("Ile de 1", "Les case 1 sont forcément entouré de murs");
    end

    def verifieTech(grille)

        grille.matrice.each do |line|
            line.each do |c|

                @casesChange = [] 

                if(c.is_a?(CaseChiffre) && c.chiffre == 1)

                    #Tour du 1, ajout d'une case comme indice si la case est vide
                    @casesChange << grille.matrice[c.y][c.x - 1] if c.x > 0 && grille.matrice[c.y][c.x - 1].etat != TypeCase::MUR
                    @casesChange << grille.matrice[c.y][c.x + 1] if c.x < (grille.matrice.length - 1) && grille.matrice[c.y][c.x + 1].etat != TypeCase::MUR
                    @casesChange << grille.matrice[c.y - 1][c.x] if c.y > 0 && grille.matrice[c.y - 1][c.x].etat != TypeCase::MUR
                    @casesChange << grille.matrice[c.y + 1][c.x] if c.y < (grille.matrice.length - 1) && grille.matrice[c.y + 1][c.x].etat != TypeCase::MUR

                end

                return true if @casesChange.empty? == false #si au moins une case peut etre surbriller renvoie la technique

            end
        end

        return false
        
    end

end