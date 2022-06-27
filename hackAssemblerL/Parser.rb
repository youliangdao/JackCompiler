A_COMMAND = 1
C_COMMAND = 2
L_COMMAND = 3

class Parser
    attr_accessor   :file_length
    attr_accessor   :current_command

    def initialize(fpAsm, fpHack)
        @all_lines = []
        @line_pointer = -1
        fpAsm.each_line do |line|
            line = format_line(line)
            @all_lines << line if line != "" && !line.nil?
        end

        @file_length = @all_lines.length    #配列の要素数＝コメントと空行除くプログラムの行数
        @current_command = get_current_command
    end
    
    def format_line(line)
        line.chomp
        reg = /\/\//.match(line) unless line == ""
        line = reg.pre_match if reg
        line.strip
    end

    def advance
        @current_command = get_current_command
    end

    def get_current_command
        @line_pointer += 1
        return nil if @file_length == @line_pointer
        @all_lines[@line_pointer]
    end

    def commandType
        if @current_command.slice(0) == "@" 
            @current_command_type = A_COMMAND
            return A_COMMAND 
        elsif @current_command.slice(0) == "(" 
            @current_command_type = L_COMMAND
            return L_COMMAND
        else
            @current_command_type = C_COMMAND
            return C_COMMAND 
        end
    end

    def symbol
        if commandType == A_COMMAND
            number = @current_command.slice(1..-1)
            return number.to_i
        else
            return @current_command.slice(1..-2)
        end
    end

    def dest
        if @current_command_type != C_COMMAND
            return nil
        else
            unless @current_command.match(/^.+=.+|.+;.+/)
                return nil
            end
            /\=/.match(@current_command).pre_match
        end

    end 
 
    def comp 
        if @current_command_type != C_COMMAND
            return nil
        else
            unless @current_command.match(/^.+=.+|.+;.+/)
                return nil
            end

            reg = /.+\=(.+)/.match(@current_command)
            return $+ if reg
            reg = /^(.+);.+/.match(@current_command)
            return $+ if reg
        end
    end
    
    def jump
        if @current_command_type != C_COMMAND
            return nil
        else
            unless @current_command.match(/^.+=.+;.+|^.+;.+/)
                return nil
            end
            /;/.match(@current_command).post_match
        end
    end
end