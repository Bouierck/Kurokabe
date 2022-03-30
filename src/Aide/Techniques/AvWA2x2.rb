require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class Island < Technique

    @@compteur 

    def Island.creer(grille)
        new(grille)
    end

    def initialize(grille)
        
        super(grille)
        @nom = "";

    end

    def verifieTech
        compteur = 0
        @grille.matrice.each do |line|
            line.each do |c|

                @casesChange = [] 

                if(c.is_a?(CaseCliquable) && c.etat == 0)

                    if @grille.matrice[c.y + 1][c.x].etat == 2 && @grille.matrice[c.y + 1][c.x + 1].etat == 2 && @grille.matrice[c.y][c.x + 1].etat == 2
                        @casesChange << c
                        return true if @casesChange.empty? == false
                    elsif @grille.matrice[c.y + 1][c.x + 1].etat == 2 && @grille.matrice[c.y][c.x + 1].etat == 2 && @grille.matrice[c.y - 1][c.x + 1].etat == 2
                        @casesChange << c
                        return true if @casesChange.empty? == false
                    elsif @grille.matrice[c.y][c.x + 1].etat == 2 && @grille.matrice[c.y - 1][c.x + 1].etat == 2 && @grille.matrice[c.y - 1][c.x].etat == 2
                        @casesChange << c
                        return true if @casesChange.empty? == false
                    elsif @grille.matrice[c.y - 1][c.x + 1].etat == 2 && @grille.matrice[c.y - 1][c.x].etat == 2 && @grille.matrice[c.y - 1][c.x - 1].etat == 2
                        @casesChange << c
                        return true if @casesChange.empty? == false
                    elsif @grille.matrice[c.y - 1][c.x].etat == 2 && @grille.matrice[c.y - 1][c.x - 1].etat == 2 && @grille.matrice[c.y][c.x - 1].etat == 2
                        @casesChange << c
                        return true if @casesChange.empty? == false 
                    elsif @grille.matrice[c.y - 1][c.- 1].etat == 2 && @grille.matrice[c.y][c.x - 1].etat == 2 && @grille.matrice[c.y + 1][c.x - 1].etat == 2
                        @casesChange << c
                        return true if @casesChange.empty? == false
                    elsif @grille.matrice[c.y][c.x - 1].etat == 2 && @grille.matrice[c.y + 1][c.x - 1].etat == 2 && @grille.matrice[c.y + 1][c.x].etat == 2
                        @casesChange << c
                        return true if @casesChange.empty? == false
                    elsif @grille.matrice[c.y + 1][c.x - 1].etat == 2 && @grille.matrice[c.y + 1][c.x].etat == 2 && @grille.matrice[c.y + 1][c.x + 1].etat == 2
                        @casesChange << c
                        return true if @casesChange.empty? == false
                    end         

                end
            end
        end

        return false
        
    end

end