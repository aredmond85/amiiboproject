class Amiiboproject::CLI

    #starts the CLI, and runs the methods
    def start
        intro
        gather_amiibos
        menu
        browse_amiibos
    end

    #outputs intro to the CLI project
    def intro
        puts "\n\n#{"Welcome to the Amiibo Selection!".colorize(:cyan)}\n\n"
        puts "Gathering all Amiibo Results...one moment..."
        puts "How do you pronouce Amiibo? Hyphenate: A-me-bo\n\n"
        puts "--------------------------------------------------------------------------------\n\n"
        sleep(1)
    end

     #creates amiibo objects, then runs browse_amiibos loop
    def gather_amiibos
        Amiiboproject::APIManager.get_amiibo
    end

    #outputs the menu of options for the user
    def menu
        puts "- Type in a #{"Nintendo Character".colorize(:red)} | #{"Game Series".colorize(:blue)} | #{"Amiibo Series".colorize(:green)}\n\n"
        puts "- Type #{'1'.colorize(:yellow)} for a list of all the Game Series included in the Amiibo collection"
        puts "- Type #{'2'.colorize(:yellow)} for a list of all the Amiibo Series included in the Amiibo collection"
        puts "- Type #{'3'.colorize(:yellow)} for a list of all the Characters included in Amiibo collection"
        puts "- Type #{'4'.colorize(:yellow)} for a list of ALL Amiibos collection\n\n"
        puts "- Type #{'exit'.colorize(:yellow)} to exit the CLI\n\n"
        puts "--------------------------------------------------------------------------------\n\n"
        sleep(2)
    end    

    #lists all amiibos by their gameSeries key with no duplicates
    def list_all_gameseries
        puts "--------------------------------------------------------------------------------\n\n"
        puts Amiiboproject::Amiibo.all.map {|x| x.gameSeries}.uniq
        puts "--------------------------------------------------------------------------------\n\n"
    end

    #lists all amiibos by their amiiboSeries key with no duplicates
    def list_all_amiiboseries
        puts "--------------------------------------------------------------------------------\n\n"
        puts Amiiboproject::Amiibo.all.map {|x| x.amiiboSeries}.uniq
        puts "--------------------------------------------------------------------------------\n\n"
    end

     #lists all amiibos by their character key with no duplicates
    def list_all_character
        puts "--------------------------------------------------------------------------------\n\n"
        puts Amiiboproject::Amiibo.all.map {|x| x.character}.uniq
        puts "--------------------------------------------------------------------------------\n\n"
    end

     #selects and lists all amiibos by Character Series inputted
    def list_by_character(input)
        characterArray = Amiiboproject::Amiibo.all.select do |x| 
            x.name.downcase == input
        end
        list_all(characterArray)
    end

    #selects and lists all amiibos by Character Series inputted
    def list_by_gameSeries(input)
        gameArray = Amiiboproject::Amiibo.all.select do |x| 
            x.gameSeries.downcase == input
        end
        list_all(gameArray)
    end

    #selects and lists all amiibos by Amiibo Series inputted
    def list_by_amiiboSeries(input)
        amiiboArray = Amiiboproject::Amiibo.all.select do |x| 
            x.amiiboSeries.downcase == input
        end
        list_all(amiiboArray)
    end

    def list_all(array)
        array.each.with_index(1) do |x, i|
            puts "Number #{i}"
            puts "--------------------------------------------------------------------------------"
            puts "  -   Character Base Name: #{x.name.split.map(&:capitalize).join(' ').colorize(:yellow)}"
            puts "  -   Character Secondary Name: #{x.character.split.map(&:capitalize).join(' ').colorize(:red)}"
            puts "  -   Game Series: #{x.gameSeries.split.map(&:capitalize).join(' ').colorize(:blue)}"  
            puts "  -   Amiibo Series: #{x.amiiboSeries.split.map(&:capitalize).join(' ').colorize(:green)}"
            puts "  -   Type of Amiibo: #{x.type.split.map(&:capitalize).join(' ').colorize(:cyan)}"
            puts "--------------------------------------------------------------------------------\n\n"   
        end
    end

    def list_all_amiibos
        Amiiboproject::Amiibo.all.each.with_index do |x, i|
            puts "--------------------------------------------------------------------------------"
            puts "#{i}." "  -   Character Base Name: #{x.name.split.map(&:capitalize).join(' ').colorize(:yellow)}"
            puts "       -   Character Secondary Name: #{x.character.split.map(&:capitalize).join(' ').colorize(:red)}"
            puts "       -   Game Series: #{x.gameSeries.split.map(&:capitalize).join(' ').colorize(:blue)}"  
            puts "       -   Amiibo Series: #{x.amiiboSeries.split.map(&:capitalize).join(' ').colorize(:green)}"
            puts "       -   Type of Amiibo: #{x.type.split.map(&:capitalize).join(' ').colorize(:cyan)}"
            puts "--------------------------------------------------------------------------------\n\n"  
        end
    end
    
    #validates if any Character Series keys exist within array
    def character_valid?(character)
        Amiiboproject::Amiibo.all.any? {|amiibo| amiibo.character.downcase == character}
    end

    #validates if any Amiibo Series keys exist within array
    def amiiboSeries_valid?(amiiboSeries)
        Amiiboproject::Amiibo.all.any? {|amiibo| amiibo.amiiboSeries.downcase == amiiboSeries}
    end

    #validates if any Game Series keys exist within array
    def gameSeries_valid?(gameSeries)
        Amiiboproject::Amiibo.all.any? {|amiibo| amiibo.gameSeries.downcase == gameSeries}
    end 

    #adds a menu options to continue and output the menu or exit
    def continue(input)
        puts "Would you like to continue?"
        puts "#{"Yes".colorize(:green)} or #{"Exit".colorize(:red)}?"
        input = nil
        input = gets.strip.downcase
        if input == "yes"
            menu
        elsif input == "exit"
            exit
        else
            puts "\n\nThat selection does not exist. Please enter in another selection.\n\n"
            continue(input)
        end
    end

    #instruction loop for everything going on
    def browse_amiibos
        input = nil
        while input != "exit" 
            input = gets.strip.downcase
            if input == "1"
                list_all_gameseries
                continue(input)
            elsif input == "2"
                list_all_amiiboseries
                continue(input)
            elsif input == "3"
                list_all_character
                continue(input)
            elsif input == "4"
                list_all_amiibos
                continue(input)
            elsif input == "exit"
                exit
            elsif character_valid?(input)
                list_by_character(input)
                continue(input)
            elsif amiiboSeries_valid?(input)
                list_by_amiiboSeries(input)
                continue(input)
            elsif gameSeries_valid?(input)
                list_by_gameSeries(input)
                continue(input)
            else
                puts "\n\nThat selection does not exist. Please enter in another selection.\n\n"
                browse_amiibos
            end
        end
    end
end
#binding.pry