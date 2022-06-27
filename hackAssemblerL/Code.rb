class Code
    def self.dest(dest)
        result = "1111111111111111"
        case dest
        when nil
            result[10..12] = "000"
        when "M"
            result[10..12] = "001"
        when "D"
            result[10..12] = "010"
        when "MD"
            result[10..12] = "011"
        when "A"
            result[10..12] = "100"
        when "AM"
            result[10..12] = "101"
        when "AD"
            result[10..12] = "110"
        when "AMD"
            result[10..12] = "111"
        end

        return result
    end

    def self.comp(comp, result)
        case comp
        when "0"
            result[3..9] = "0101010"
        when "1"
            result[3..9] = "0111111"
        when "-1"
            result[3..9] = "0111010"
        when "D"
            result[3..9] = "0001100"
        when "A"
            result[3..9] = "0110000"
        when "!D"
            result[3..9] = "0001101"
        when "!A"
            result[3..9] = "0110001"
        when "-D"
            result[3..9] = "0001111"
        when "-A"
            result[3..9] = "0110011"
        when "D+1"
            result[3..9] = "0011111"
        when "A+1"
            result[3..9] = "0110111"
        when "D-1"
            result[3..9] = "0001110"
        when "A-1"
            result[3..9] = "0110010"
        when "D+A"
            result[3..9] = "0000010"
        when "D-A"
            result[3..9] = "0010011"
        when "A-D"
            result[3..9] = "0000111"
        when "D&A"
            result[3..9] = "0000000"
        when "D|A"
            result[3..9] = "0010101"
        when "M"
            result[3..9] = "1110000"
        when "!M"
            result[3..9] = "1110001"
        when "-M"
            result[3..9] = "1110011"
        when "M+1"
            result[3..9] = "1110111"
        when "M-1"
            result[3..9] = "1110010"
        when "D+M"
            result[3..9] = "1000010"
        when "D-M"
            result[3..9] = "1010011"
        when "M-D"
            result[3..9] = "1000111"
        when "D&M"
            result[3..9] = "1000000"
        when "D|M"
            result[3..9] = "1010101"
            
        end

        return result
    end

    def self.jump(jump, result)
        case jump
        when nil
            result[13..15] = "000"
        when JGT
            result[13..15] = "001"
        when JEQ
            result[13..15] = "010"
        when JGE
            result[13..15] = "011"
        when JLT
            result[13..15] = "100"
        when JNE
            result[13..15] = "101"
        when JLE
            result[13..15] = "110"
        when JMP
            result[13..15] = "111"
        end

        return result
    end
end