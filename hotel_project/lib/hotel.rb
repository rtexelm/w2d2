require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name, rooms)
        
        @name = name
        @rooms = rooms.keys.map {|k| [k, Room.new(rooms[k])] }.to_h

    end

    def name
        @name.split.map(&:capitalize).join(" ")
    end

    def room_exists?(room)
        @rooms.has_key?(room)
    end
    
    def check_in(person, room)
        return puts "sorry, room does not exist" if !self.room_exists?(room)
        if @rooms[room].add_occupant(person)
            return puts "check in successful" 
        else
            return puts "\nsorry, room is full"
        end
    end

    def has_vacancy?
        every_room = @rooms.values
        !every_room.all?(&:full?) #{|r| print r.full?}
    end

    def list_rooms
        @rooms.each {|room_name, room| puts "#{room_name} #{room.available_space}"}
    end

end
