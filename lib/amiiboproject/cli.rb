class Amiiboproject::CLI

    def start
        intro
        instruction_loop

    end

    def intro
        puts "\n"
        puts "Welcome to the Amiibo Selection!"
        puts "\n"
    end

    def gets_input(input)
        input = gets.strip
    end

    #outputs the text to put in a valid option
    def invalid_selection
        puts "Please enter a valid option!"
        puts "\n"
    end  
    
    def list_by_all_name
        Amiiboproject::Amiibo.all.each_with_index {|x, i| puts "#{i+1}. #{x.name}"}
    end

       #finds characters associated by the character name
    def list_by_character(input)
        Amiiboproject::Amiibo.all.select {|x| puts "#{x.name.capitalize}" if x.character.downcase == input}
    end

    #outputs the menu of options for the user
    def menu
        puts "Type in a Nintendo character to see a list of Amiibos associated with that character or all to see ALL Amiibos."
        puts "Type 'exit' to exit the CLI"
        puts "\n"
        sleep(2)
    end

    def instruction_loop
        puts "Compiling all Amiibo Results...one moment..."
        sleep(1)
        puts "\n"
        Amiiboproject::Amiibo.create(Amiiboproject::APIManager.get_amiibo)
        menu
        input = nil 
        while input != "exit" 
            input = gets.strip.downcase
            case input
                when "zelda"
                    list_by_character(input)
                    puts "Please enter another character or type 'menu' for menu: \n"
                when "mario"
                    list_by_character(input)
                    puts "Please enter another character or type 'menu' for menu: \n"
                when "all"
                    list_by_all_name
                    puts "Please enter another character or type 'menu' for menu: \n"
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
 

