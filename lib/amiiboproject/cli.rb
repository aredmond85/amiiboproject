class Amiiboproject::CLI

    #starts the CLI, and runs the methods
    def start
        intro
        instruction_loop
    end

    #outputs intro to the CLI project
    def intro
        puts "\n"
        puts "Welcome to the Amiibo Selection!"
        puts "\n"
    end

    #outputs the text to put in a valid option
    def invalid_selection
        puts "Please enter a valid option!"
        puts "\n"
    end  
    
    #finds all amiibos by name
    def list_by_all_name
        Amiiboproject::Amiibo.all.each_with_index do |x, i| 
            puts "#{i+1}. Name: #{x.name.split.map(&:capitalize).join(' ')}"
            puts "      " + "Character Series: #{x.character.split.map(&:capitalize).join(' ')}"
            puts "      " + "Game Series: #{x.gameSeries.split.map(&:capitalize).join(' ')}"
        end 
    end

    #finds characters associated by the character name
    def list_by_character(input)
        Amiiboproject::Amiibo.all.select.with_index do |x, i| 
            if x.character.downcase == input
                puts "#{i+1}. Name: #{x.name.split.map(&:capitalize).join(' ')}"
                puts "     " + "Character Series: #{x.character.split.map(&:capitalize).join(' ')}"
                puts "     " + "Game Series: #{x.gameSeries.split.map(&:capitalize).join(' ')}"   
            end 
        end
    end

    #lists all uniq gameSeries for the amiibos
    def list_all_gameseries
        array = []
        Amiiboproject::Amiibo.all.each {|x| array << x.gameSeries}
        puts array.uniq
    end

    #counts the number amiibos from a selection and outputs that sum of those
    def count_entries
    end

    #outputs the menu of options for the user
    def menu
        puts "Type in a Nintendo character to see a list of Amiibos associated with that character or all to see ALL Amiibos."
        puts "Type 'exit' to exit the CLI"
        puts "\n"
        sleep(2)
    end

    #instruction loop for everything going on
    def instruction_loop
        puts "Gathering all Amiibo Results...one moment..."
        sleep(1)
        puts "\n"
        Amiiboproject::Amiibo.create(Amiiboproject::APIManager.get_amiibo)
        menu
        input = nil 
        while input != "exit" 
            input = gets.strip.downcase
            case input
                when "zelda"
                    puts "----------------------------"
                    list_by_character(input)
                    puts "----------------------------"
                    puts "Please enter another character or type 'menu' for menu: \n"
                when "mario"
                    puts "----------------------------"
                    list_by_character(input)
                    puts "----------------------------"
                    puts "Please enter another character or type 'menu' for menu: \n"
                when "games"
                    puts "----------------------------"
                    list_all_gameseries
                    puts "----------------------------"
                    puts "Please enter another character or type 'menu' for menu: \n"
                when "all"
                    puts "----------------------------"
                    list_by_all_name
                    puts "----------------------------"
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
 

