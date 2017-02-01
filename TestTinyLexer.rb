load "./TinyToken.rb"
load "./TinyScanner.rb"

# filename.txt below is simply the "source code"
# that you write that adheres to your grammar rules
# if it is in the same directory as this file, you can
# simply include the file name, otherwise, you will need
# to specify the entire path to the file as we did above
# to load the other ruby modules
scan = Scanner.new("input.txt")
output = open("output.txt", 'w')
tok = scan.nextToken()
while (tok.get_type() != Token::EOF)

   puts "Token: #{tok} \ttype: #{tok.get_type()}"
   output.write("Token: #{tok} \ttype: #{tok.get_type()}\n")
   tok = scan.nextToken()
end
puts "Token: #{tok} \ttype: #{tok.get_type()}"
output.write("Token: #{tok} \ttype: #{tok.get_type()}\n")
output.close()
