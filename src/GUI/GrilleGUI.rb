require_relative '../Niveau/Grille.rb'
require_relative  '../Niveau/CaseCliquable.rb'

require_relative './CaseChiffreGUI.rb'
require_relative './CaseCliquableGUI.rb'

require 'gtk3'

class GrilleGUI < Gtk::Grid

    ##
    # @grille => grille reprséenté par ce GUI
    # @matriceGUI => matrice contenant les boutons de la grille

    def GrilleGUI.creer(grille)
        new(grille)
    end

    private_class_method :new

    def initialize(grille)

        super()
        @grille = grille
        @matriceGUI = @grille.matrice.map(&:clone)
        initMatriceGui

    end

    def initMatriceGui

        @matriceGUI.each do |line|
            line.each do |c|

                if(c.is_a?(CaseCliquable))
                    @matriceGUI[c.y][c.x] = CaseCliquableGUI.creer(c)
                else
                    @matriceGUI[c.y][c.x] = CaseChiffreGUI.creer(c)
                end

                self.attach(@matriceGUI[c.y][c.x], c.x*2, c.y*2, 2, 2)

            end
        end

    end

    def updateGrille

        @matriceGUI.each do |line|
            line.each do |c|
                c.updateCaseGUI if(c.is_a?(CaseCliquableGUI))
            end
        end

        @grille.update

    end

end