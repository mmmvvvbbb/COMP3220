# https://www.cs.rochester.edu/~brown/173/readings/05_grammars.txt
#
#  "TINY" Grammar
#
# PGM        -->   STMT+
# STMT       -->   ASSIGN   |   "print"  EXP
# ASSIGN     -->   ID  "="  EXP
# EXP        -->   TERM   ETAIL
# ETAIL      -->   "+" TERM   ETAIL  | "-" TERM   ETAIL | EPSILON
# TERM       -->   FACTOR  TTAIL
# TTAIL      -->   "*" FACTOR TTAIL  | "/" FACTOR TTAIL | EPSILON
# FACTOR     -->   "(" EXP ")" | INT | ID
#
# ID         -->   ALPHA+
# ALPHA      -->   a  |  b  | … | z  or
#                  A  |  B  | … | Z
# INT        -->   DIGIT+
# DIGIT      -->   0  |  1  | …  |  9
# WHITESPACE -->   Ruby Whitespace

#
#  Class Scanner - Reads a TINY program and emits tokens
#
class Scanner
# Constructor - Is passed a file to scan and outputs a token
#               each time nextToken() is invoked.
#   @c        - A one character lookahead
	def initialize(filename)
		@s = ""
		begin
		@f = File.open(filename,'r:utf-8')
		if (! @f.eof?)
			@c = @f.getc()
		else
			@c = "!eof!"
			@f.close()
		end
		rescue
			@c = "!fnf!"
		end
	end

	# Method nextCh() returns the next character in the file
	def nextCh()
		if !@s.empty?
			@c = @s[0]
			@s[0] = ''
			puts @c
		elsif (! @f.eof?)
			@c = @f.getc()
		else
			@c = "!eof!"
		end

		return @c
	end
	# Method nextToken() reads characters in the file and returns
	# the next token
	def nextToken()
		if @c == "!eof!"
			return Token.new(Token::EOF,"eof") #return end of file.
		elsif @c == "!fnf!"
			return Token.new(Token::EOF,"File Not Found")	#return file not found
		elsif (whitespace?(@c))
			str = ""
			while whitespace?(@c)
				if @c != " "		#get rid of pesky outputs that ruin outputs
					if @c == "\n"
						@c = "\\n"	#Add newline operator to the whitespace output.
					else
						@c = ""
					end
				end
				str += @c
				nextCh()
			end
			tok = Token.new(Token::WS,str)
			return tok
		elsif (letter?(@c))
			str = ""
			while letter?(@c)
				str += @c
				nextCh()
			end
			if str == "print"
				return Token.new(Token::PRINT, str)
			end
			tok = Token.new(Token::ID,str)
			return tok
		elsif (numeric?(@c))
				str = ""
				while numeric?(@c)
						str += @c
						nextCh()
				end
				tok = Token.new(Token::INT, str)
				return tok
		elsif (@c == "(")
			tok = Token.new(Token::LPAREN,@c)
			nextCh()
			return tok
		elsif (@c == ")")
			tok = Token.new(Token::RPAREN,@c)
			nextCh()
			return tok
		elsif (@c == "+")
			tok = Token.new(Token::ADDOP,@c)
			nextCh()
			return tok
		elsif (@c == "-")
			tok = Token.new(Token::SUBOP,@c)
			nextCh()
			return tok
		elsif (@c == "*")
			tok = Token.new(Token::MULOP,@c)
			nextCh()
			return tok
		elsif (@c == "/")
			tok = Token.new(Token::DIVOP,@c)
			nextCh()
			return tok
		elsif (@c == "=")
			tok = Token.new(Token::EQUAL,@c)
			nextCh()
			return tok
		end
		tok = Token.new("WTF","Wrong Token Found: " << @c)
		nextCh()
		return tok
	end
end
#
# Helper methods for Scanner
#
def letter?(lookAhead)
	lookAhead =~ /^[a-z]|[A-Z]$/
end

def numeric?(lookAhead)
	lookAhead =~ /^(\d)+$/
end

def whitespace?(lookAhead)
	lookAhead =~ /^(\s)+$/
end
