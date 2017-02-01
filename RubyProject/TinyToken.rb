#
#  Class Token - Encapsulates the tokens in TINY
#
#   @type - the type of token
#   @text - the text the token represents
#
class Token
	attr_accessor :type
	attr_accessor :text

#Token Constants
	EOF 		= "eof"
	LPAREN 	= "("
	RPAREN 	= ")"
	ADDOP  	= "+"
	SUBOP		= "-"
	MULOP		= "*"
	DIVOP		= "/"
	WS			= "Ruby Whitespace"
	ID			= "ID"
	INT 		= "INT"
	EQUAL		= "="
	PRINT 	= "print"

#initializes a token with given type and text
	def initialize(type,text)
		@type = type
		@text = text
	end

#returns the type (ususally a Token::XXXX format)
	def get_type
		return @type
	end

#returns the actual token text from the input
	def get_text
		return "\"#{@text}\""
	end

#Returns the text to string
	def to_s
	# return "[Type: #{@type} || Text: #{@text}]"
		return get_text()
	end
end
