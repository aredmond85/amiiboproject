class Amiiboproject::CLI

    #starts the CLI, and runs the methods
    def start
        intro
        gather_amiibos
    end

    #outputs intro to the CLI project
    def intro
        puts "\n"
        puts "Welcome to the Amiibo Selection!"
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
        as = Amiiboproject::Amiibo.all.select do |x| 
            x.character.downcase == input
        end
        as.each.with_index(1) do |x, i|
            puts "#{i}. Name: #{x.name.split.map(&:capitalize).join(' ')}"
            puts "   " + "Character Series: #{x.character.split.map(&:capitalize).join(' ')}"
            puts "   " + "Game Series: #{x.gameSeries.split.map(&:capitalize).join(' ')}"  
            puts "   " + "Amiibo Series: #{x.amiiboSeries.split.map(&:capitalize).join(' ')}"  
        end
    end

    def list_by_amiiboSeries(input)
        as = Amiiboproject::Amiibo.all.select do |x| 
            x.amiiboSeries.downcase == input
        end
        as.each.with_index(1) do |x, i|
            puts "#{i}. Name: #{x.name.split.map(&:capitalize).join(' ')}"
            puts "   " + "Character Series: #{x.character.split.map(&:capitalize).join(' ')}"
            puts "   " + "Game Series: #{x.gameSeries.split.map(&:capitalize).join(' ')}"  
            puts "   " + "Amiibo Series: #{x.amiiboSeries.split.map(&:capitalize).join(' ')}\n\n"  
        end
    end

    #lists all uniq gameSeries for the amiibos
    def list_all_gameseries
        array = []
        Amiiboproject::Amiibo.all.each {|x| array << x.gameSeries}
        puts array.uniq
    end

    def list_all_amiiboseries
        array = []
        as = Amiiboproject::Amiibo.all.each {|x| array << x.amiiboSeries}
        puts array.uniq
    end

    #outputs the menu of options for the user
    def menu
        puts "Type in a #{"Nintendo".colorize(:blue)} character or Nintendo Series"
        puts "Type 'all' to see ALL amiibos"
        puts "Type 'exit' to exit the CLI"
        puts "\n"
        sleep(2)
    end
    
    def gather_amiibos
        puts "Gathering all Amiibo Results...one moment..."
        sleep(1)
        puts "\n"
        Amiiboproject::Amiibo.create(Amiiboproject::APIManager.get_amiibo)
        browse_amiibos
    end

    def character_valid?(character)
        Amiiboproject::Amiibo.all.any? { |amiibo| amiibo.character.downcase == character}
    end

    def amiiboSeries_valid?(amiiboSeries)
        Amiiboproject::Amiibo.all.any? { |amiibo| amiibo.amiiboSeries.downcase == amiiboSeries}
    end

    def another_input
        puts "\n\nEnter another character"
        puts "Enter 'menu' to repeat the menu"
        puts "Enter an amiibo series you would like to see"
        puts "Enter 'exit' to exit the app \n\n"
    end

    #instruction loop for everything going on
    def browse_amiibos
        menu
        input = nil 
        while input != "exit" 
            input = gets.strip.downcase
            if input == "games"
                list_all_gameseries
                another_input
            elsif input == "all"
                list_by_all_name
                another_input
            elsif input == "menu"
                menu 
            elsif input == "exit"
                exit
            elsif character_valid?(input)
                list_by_character(input)
                another_input
            elsif amiiboSeries_valid?(input)
                list_by_amiiboSeries(input)
                another_input
            else
                puts "Please enter a valid character."
                browse_amiibos
            end
            end
        end 
    end

#binding.pry