require_relative './Technique.rb'
require_relative '../../Niveau/CaseCliquable.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class Island2Cases < Technique

    public_class_method :new

    def initialize
        
        super(Langue.text("Island2Cases"), Langue.text("Island2CasesDesc"))

    end

    def verifieTech(grille)

        grille.matrice.each do |line|
            line.each do |c|
 
                @casesChange = []

                if(c.is_a?(CaseChiffre) && c.chiffre == 2)

                    ################################################################
                    #  2 . .   . M .   . . .   . . .  . M 2                        #
                    #  . ? .   M 2 .   . . .   . . M  . . .  Mur en bas a droite ? #
                    #  . . .   . . ?   . M 2   . . 2  . . .                        #
                    ################################################################
                    if( (c.x <= 0  || grille.matrice[c.y][c.x - 1].etat == TypeCase::MUR) && (c.y <= 0  || grille.matrice[c.y - 1][c.x].etat == TypeCase::MUR) )
                    

                        @casesChange << grille.matrice[c.y + 1][c.x + 1] if (c.y + 1 < grille.matrice.length && c.x + 1 < grille.matrice.length && grille.matrice[c.y + 1][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y + 1][c.x + 1].etat != TypeCase::MUR)

                        return true if @casesChange.empty? == false
                    
                    end
                    #Mur bas gauche ?
                    if ( (c.x >= grille.matrice.length - 1  || grille.matrice[c.y][c.x + 1].etat == TypeCase::MUR) && (c.y <= 0  || grille.matrice[c.y - 1][c.x].etat == TypeCase::MUR)) 
                    
                        @casesChange << grille.matrice[c.y + 1][c.x - 1] if c.y + 1 < grille.matrice.length && c.x > 0 && grille.matrice[c.y + 1][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y + 1][c.x - 1].etat != TypeCase::MUR

                        return true if @casesChange.empty? == false
                    
                    end
                    #Mur haut droit ?
                    if ( (c.x <= 0  || grille.matrice[c.y][c.x - 1].etat == TypeCase::MUR) && (c.y >= grille.matrice.length - 1  || grille.matrice[c.y + 1][c.x].etat == TypeCase::MUR)) 
                        
                        @casesChange << grille.matrice[c.y - 1][c.x + 1] if c.y > 0 && c.x + 1 < grille.matrice.length && grille.matrice[c.y - 1][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y - 1][c.x + 1].etat != TypeCase::MUR

                        return true if @casesChange.empty? == false
                    
                    end

                    #Mur haut gauche ?
                    if ( (c.x >= grille.matrice.length - 1  || grille.matrice[c.y][c.x + 1].etat == TypeCase::MUR) && (c.y >= grille.matrice.length - 1  || grille.matrice[c.y + 1][c.x].etat == TypeCase::MUR)) 
                        
                        @casesChange << grille.matrice[c.y - 1][c.x - 1] if c.y > 0 && c.x > 0 && grille.matrice[c.y - 1][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y - 1][c.x - 1].etat != TypeCase::MUR

                        return true if @casesChange.empty? == false

                    end

                end

            end
        end

        return false
        
    end

end