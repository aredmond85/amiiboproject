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
        while input != "exit" 
            input = gets.strip.downcase
            case input
                when "zelda"
                    list_selected_character
                    puts "Please enter another character or type 'menu' for menu: \n\n"
                when "mario"
                    list_selected_character
                    puts "Please enter another character or type 'menu' for menu: \n\n"
                when "all"
                    list_all_characters
                    puts "Please enter another character or type 'menu' for menu: \n\n"
                when "menu"
                    menu 
                when "exit"
                    exit
                else 
                    puts invalid_selection
                end
            end
        end 
    end

    def menu
        puts "Please pick your selection of characters below:"
        puts "\n"
        puts "1) Type 'zelda' for a list of Zelda related characters"
        puts "2) Type 'mario' for a list of Mario related characters"
        puts "3) Type 'zelda' for a list of Zelda related characters"
        puts "\n"
        puts "Type exit to exit the program."
    end


    def gets_input(input)
        input = gets.strip
    end

    # def valid?(input)
    #    if input != "zelda" || "mario" || "all"
    # end

    def invalid_selection
        puts "\nPlease enter a valid option! \n"
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

 

