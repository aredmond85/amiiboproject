class Amiiboproject::CLI

    #starts the CLI, and runs the methods
    def start
        intro
        gather_amiibos
    end

    #outputs intro to the CLI project
    def intro
        puts "\n\nWelcome to the Amiibo Selection!\n\n"
    end

    #outputs the menu of options for the user
    def menu
        puts "Type in a Nintendo character or Nintendo Series"
        puts "Type 'all' to see ALL amiibos"
        puts "Type 'exit' to exit the CLI"
        puts "\n"
        sleep(2)
    end

     #creates amiibo objects, then runs browse_amiibos loop
     def gather_amiibos
        puts "Gathering all Amiibo Results...one moment..."
        sleep(1)
        puts "\n"
        Amiiboproject::Amiibo.create(Amiiboproject::APIManager.get_amiibo)
        browse_amiibos
    end
    
    #instruction loop for everything going on
    def browse_amiibos
        menu
        input = nil 
        while input != "exit" 
                input = gets.strip.downcase
                if input == "1"
                    list_all_gameseries
                    second_instructions
                elsif input == "2"
                    list_all_character
                    second_instructions
                elsif input == "3"
                    list_all_character
                    second_instructions
                elsif input == "4"
                    menu 
                elsif character_valid?(input)
                    list_by_character(input)
                    second_instructions
                elsif amiiboSeries_valid?(input)
                    list_by_amiiboSeries(input)
                    second_instructions
                elsif gameSeries_valid?(input)
                    list_by_amiiboSeries(input)
                    second_instructions
                elsif input == "exit"
                    exit
                else
                    puts "Please enter a valid character."
                    browse_amiibos
                end
            end
        end 
    end

     #lists all amiibos by their amiiboSeries key
     def list_all_character
        array = []
        as = Amiiboproject::Amiibo.all.each {|x| array << x.character}
        puts array.uniq
    end

     #lists all amiibos by their gameSeries key
     def list_all_gameseries
        array = []
        as = Amiiboproject::Amiibo.all.each {|x| array << x.gameSeries}
        puts array.uniq
    end

    #lists all amiibos by their amiiboSeries key
    def list_all_amiiboseries
        array = []
        as = Amiiboproject::Amiibo.all.each {|x| array << x.amiiboSeries}
        puts array.uniq
    end

     #selects and lists all amiibos by Character Series inputted
     def list_by_character(input)
        as = Amiiboproject::Amiibo.all.select do |x| 
            x.name.downcase == input
        end
        as.each.with_index(1) do |x, i|
            puts "#{i}. Name: #{x.name.split.map(&:capitalize).join(' ')}"
            puts "  -   " + "Character Series: #{x.character.split.map(&:capitalize).join(' ')}\n\n"
            puts "  -   " + "Game Series: #{x.gameSeries.split.map(&:capitalize).join(' ')}\n\n"  
            puts "  -   " + "Amiibo Series: #{x.amiiboSeries.split.map(&:capitalize).join(' ')}\n\n"  
        end
    end

    #selects and lists all amiibos by Character Series inputted
    def list_by_gameSeries(input)
        as = Amiiboproject::Amiibo.all.select do |x| 
            x.gameSeries.downcase == input
        end
        as.each.with_index(1) do |x, i|
            puts "#{i}. Name: #{x.name.split.map(&:capitalize).join(' ')}"
            puts "  -   " + "Character Series: #{x.character.split.map(&:capitalize).join(' ')}\n\n"
            puts "  -   " + "Game Series: #{x.gameSeries.split.map(&:capitalize).join(' ')}\n\n"  
            puts "  -   " + "Amiibo Series: #{x.amiiboSeries.split.map(&:capitalize).join(' ')}\n\n"  
        end
    end

    #selects and lists all amiibos by Amiibo Series inputted
    def list_by_amiiboSeries(input)
        as = Amiiboproject::Amiibo.all.select do |x| 
            x.amiiboSeries.downcase == input
        end
        as.each.with_index(1) do |x, i|
            puts "#{i}. Name: #{x.name.split.map(&:capitalize).join(' ')}"
            puts "  -   " + "Character Series: #{x.character.split.map(&:capitalize).join(' ')}\n\n"
            puts "  -   " + "Game Series: #{x.gameSeries.split.map(&:capitalize).join(' ')}\n\n"  
            puts "  -   " + "Amiibo Series: #{x.amiiboSeries.split.map(&:capitalize).join(' ')}\n\n"  
        end
    end

    #selects and lists all amiibos by Game Series inputted
    def list_by_amiiboSeries(input)
        as = Amiiboproject::Amiibo.all.select do |x| 
            x.gameSeries.downcase == input
        end
        as.each.with_index(1) do |x, i|
            puts "#{i}. Name: #{x.name.split.map(&:capitalize).join(' ')}"
            puts "  -   " + "Character Series: #{x.character.split.map(&:capitalize).join(' ')}\n\n"
            puts "  -   " + "Game Series: #{x.gameSeries.split.map(&:capitalize).join(' ')}\n\n"  
            puts "  -   " + "Amiibo Series: #{x.amiiboSeries.split.map(&:capitalize).join(' ')}\n\n"  
        end
    end
    
    #validates if any Character Series keys exist within hash array
    def character_valid?(character)
        Amiiboproject::Amiibo.all.any? { |amiibo| amiibo.character.downcase == character}
    end

    #validates if any Amiibo Series keys exist within hash array
    def amiiboSeries_valid?(amiiboSeries)
        Amiiboproject::Amiibo.all.any? { |amiibo| amiibo.amiiboSeries.downcase == amiiboSeries}
    end

    #validates if any Game Series keys exist within hash array
    def gameSeries_valid?(amiiboSeries)
        Amiiboproject::Amiibo.all.any? { |amiibo| amiibo.gameSeries.downcase == gameSeries}
    end

    #outputs secondary menu after the selection has run
    def second_instructions
        puts "\n\nEnter another character"
        puts "Enter 'menu' to repeat the menu"
        puts "Enter an amiibo series you would like to see"
        puts "Enter 'exit' to exit the app \n\n"
    end