load "./TinyToken.rb"
load "./TinyScanner.rb"

# filename.txt below is simply the "source code"
# that you write that adheres to your grammar rules
# if it is in the same directory as this file, you can
# simply include the file name, otherwise, you will need
# to specify the entire path to the file as we did above
# to load the other ruby modules
scan = Scanner.new("input.txt")     #Opens a scanner for the input file.
output = open("output.txt", 'w')    #Opens The output file
tok = scan.nextToken()              #Gets the first token
while (tok.get_type() != Token::EOF)  #Loops until the EOF token is found Note
                                      #File not found also returns an EOF token
   puts "Token: #{tok} \ttype: #{tok.get_type()}"     #prints the token + the type to console
   output.write("Token: #{tok} \ttype: #{tok.get_type()}\n") #writes to file
   tok = scan.nextToken()             #gets the next token.
end
puts "Token: #{tok} \ttype: #{tok.get_type()}"  #prints the EOF
output.write("Token: #{tok} \ttype: #{tok.get_type()}\n") #Writes the EOF to file
output.close() #closes file
