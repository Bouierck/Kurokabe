class Test

    def self.assert(numero, condition)

        if(condition)
            puts("Assertion #{numero}: OK!")
        else
            puts("Assertion #{numero}: KO!")
        end
        
    end

end