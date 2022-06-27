require './Parser.rb'
require './Code.rb'

class Main
    def initialize
        asmFileName = ARGV[0]
        hackFileName = asmFileName.gsub(".asm", ".hack")
        fpAsm = File.open(asmFileName, "r")
        fpHack = File.open(hackFileName, "w")

        parser = Parser.new(fpAsm, fpHack)
        

        parser.file_length.times do
            case parser.commandType
            when A_COMMAND
                result = convert_to_bit(parser.symbol)
                
            when C_COMMAND
                dest = parser.dest
                result = Code.dest(dest)
                comp = parser.comp
                result = Code.comp(comp, result)
                jump = parser.jump
                result = Code.jump(jump, result)
            end

            fpHack.puts(result)
            parser.advance
        end

        fpHack.close
        fpHack.close
    end

    def convert_to_bit(num)
        result = []
        num = num.to_i
        16.times do
            result.unshift(num % 2)
            num = num / 2
        end
        result.join
    end

end

Main.new