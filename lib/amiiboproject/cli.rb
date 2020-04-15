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

    #outputs the menu of options for the user
    def menu
        puts "Please pick your selection of characters below:"
        puts "\n"
        puts "1) Type 'zelda' for a list of Zelda related characters"
        puts "2) Type 'mario' for a list of Mario related characters"
        puts "3) Type 'zelda' for a list of Zelda related characters"
        puts "4) Type 'all' for a list of All Amiibo characters"
        puts "\n"
        puts "Type exit to exit the program."
    end


    def gets_input(input)
        input = gets.strip
    end

    #outputs the text to put in a valid option
    def invalid_selection
        puts "\nPlease enter a valid option! \n"
    end     

 

