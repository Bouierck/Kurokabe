require  'gtk3'

class CaseGUI < Gtk::Button 

    ##
    # @case case qui est représentée par ce GUI

    attr_reader :case

    def CaseGUI.creer(c)
        new(c)
    end

    private_class_method :new

    def initialize(c)
        super()
        @case = c
    end

end