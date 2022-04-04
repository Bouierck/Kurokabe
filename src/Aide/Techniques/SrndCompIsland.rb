require_relative './Technique.rb'
require_relative '../../Niveau/CaseCliquable.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class SrndCompIsland < Technique

     n = 0

    def SrndCompIsland.creer(grille)
        new(grille)
    end

    def initialize(grille)
        
        super(grille)
        @nom = "Fermeture ile";

    end

    def verifieTech

        @grille.matrice.each do |line|
            line.each do |c|
 
                @casesChange = []

                if(c.is_a?(CaseChiffre) && c.chiffre == 3)
                    caseD = c
                    puts c.chiffre
                    while n <= c.chiffre - 1 # Tant que n est inférieur ou égal au chiffre, le code est exécuté.
                        
                        #Case en haut 
                        if (@grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y + 1][c.x].etat == 1)
                            @casesChange.push(@grille.matrice[c.y + 1][c.x]) 
                            caseD = c
                            n+=1 
                        #Case à droite
                        elsif (@grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x + 1].etat == 1)
                            @casesChange.push(@grille.matrice[c.y][c.x + 1])
                            caseD = c
                            n+=1
                        #Case en bas
                        elsif (@grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y - 1][c.x].etat == 1)
                            @casesChange.push(@grille.matrice[c.y - 1][c.x])
                            caseD = c
                            n+=1  
                        #Case à gauche
                        elsif (@grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x - 1].etat == 1)
                            @casesChange.push(@grille.matrice[c.y][c.x - 1])
                            caseD = c  
                            n+=1
                        end
                    end
                    #Verifie la case en haut 
                    if(@grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y + 1][c.x].etat == 0)
                        @casesChange.push(@grille.matrice[c.y + 1][c.x])
                    end
                    #Verifie la case à droite
                    if(@grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x + 1].etat == 0)
                        @casesChange.push(@grille.matrice[c.y][c.x + 1])
                    end
                    #Verifie la case en bas
                    if(@grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y - 1][c.x].etat == 0)
                        @casesChange.push(@grille.matrice[c.y - 1][c.x]) 
                    end
                    #Verifie la case à gauche
                    if(@grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x - 1].etat == 0)
                        @casesChange.push(@grille.matrice[c.y][c.x - 1]) 
                    end

                end

                return true if @casesChange.empty? == false

            end
        end

        return false
        
    end

end