fs = []

Dir.entries("./assets/levels/Classe").select { |f| 
    if(f.start_with?(".") == false && f.include?("corrige")) then 
        fs << f 
end}

fs.each { |f|

    fa = File.open("./assets/levels/Classe/" + f, "r+")

    l = fa.read()
    sa = l.split("\n")[2]
    sa = sa.gsub("-3", "-4")
    sa = sa.gsub("-2", "-3")
    sa = sa.gsub("-4", "-2")
    fa.write("\n" + sa)

    #fa.write(l)
    fa.close()

}