require_relative './Technique.rb'
require_relative '../../Niveau/CaseCliquable.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class Island2Cases < Technique

    def Island2Cases.creer(grille)
        new(grille)
    end

    def initialize(grille)
        
        super(grille)
        @nom = "Ile de 2";

    end

    def verifieTech

        @grille.matrice.each do |line|
            line.each do |c|
 
                @casesChange = []

                if(c.is_a?(CaseChiffre) && c.chiffre == 2)
                    
                    #Case en diagonale haut gauche
                    @casesChange.push(@grille.matrice[c.y + 1][c.x - 1]) if @grille.matrice[c.y][c.x + 1].etat == 2 && @grille.matrice[c.y - 1][c.x].etat == 2 && @grille.matrice[c.y][c.x - 1].etat == 0 && @grille.matrice[c.y + 1][c.x].etat == 0 && @grille.matrice[c.y + 1][c.x - 1].etat == 0
                    #Case en diagonale bas gauche
                    @casesChange.push(@grille.matrice[c.y - 1][c.x - 1]) if @grille.matrice[c.y][c.x + 1].etat == 2 && @grille.matrice[c.y + 1][c.x].etat == 2 && @grille.matrice[c.y][c.x - 1].etat == 0 && @grille.matrice[c.y - 1][c.x].etat == 0 && @grille.matrice[c.y - 1][c.x - 1].etat == 0
                    #Case en diagonale bas droite
                    @casesChange.push(@grille.matrice[c.y - 1][c.x + 1]) if @grille.matrice[c.y][c.x - 1].etat == 2 && @grille.matrice[c.y + 1][c.x].etat == 2 && @grille.matrice[c.y][c.x + 1].etat == 0 && @grille.matrice[c.y - 1][c.x].etat == 0 && @grille.matrice[c.y - 1][c.x + 1].etat == 0
                    #Case en diagonale haut droite
                    @casesChange.push(@grille.matrice[c.y + 1][c.x + 1]) if @grille.matrice[c.y][c.x - 1].etat == 2 && @grille.matrice[c.y - 1][c.x].etat == 2 && @grille.matrice[c.y][c.x + 1].etat == 0 && @grille.matrice[c.y + 1][c.x].etat == 0 && @grille.matrice[c.y + 1][c.x + 1].etat == 0

                end

                return true if @casesChange.empty? == false

            end
        end

        return false
        
    end

end