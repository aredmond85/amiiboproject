class Amiiboproject::CLI

    def start
        intro
        instruction_loop
    end

    def intro
        puts "Welcome to the Amiibo Selection!"
    end

    def instruction_loop
        menu
        input = nil 
        while input != "exit" && !valid?
            input = gets.downcase
            case input
                when "zelda"
                    list_selected_character
                when "mario"
                    list_selected_character
                when "all"
                    list_all_characters
                else 
                    puts invalid_selection
            end
        end 
    end

    def menu
        puts "Please pick your selection of characters below: \n"
        puts "Type Zelda for Zelda characters"
        puts "Type Mario for Mario characters"
        puts "Type All for All Characters"
        puts "Enter Selection below"
    end


    def gets_input(input)
        input = gets.strip
    end

    def valid?(input)
       if input != "zelda" || "mario" || "all"
    end

    def invalid_selection
        puts "I did not recognize that, please put in another character."
        sleep(1)
    end

    def list_selected_character
        #iterate through amiibo array
        #select the character
        #output all instances of that amiibo character
    end

    def list_all_characters
        Amiiboproject::Amiibo.all.each do |amiibo| 
            puts "The character is: #{amiibo.character} \n"
            puts "The character comes from this game series: #{amiibo.gameSeries} \n"
            puts "The name of the figure is: #{amiibo.name} \n \n"
        end
    end      
end
end
 

