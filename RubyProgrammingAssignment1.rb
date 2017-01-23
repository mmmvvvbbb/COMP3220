class Scanner
def initialize(filename)
	@f = File.open(filename, 'r:utf-8')
	if (! @f.eof?)
		@c = @f.getc()
	else
		@c = "eof"
		@f.close()
	end
end

def nextCh()
	if (! @f.eof?)
		@c = @f.getc()
	else
		@c = "eof"
		@f.close()
	end
	return @c
end

def nextToken()
	if @c == "eof" 
		tok = Token.new(Token::EOF,"eof") 
	elsif (whitespace?(@c)) 
		str ="" 
		while whitespace?(@c) 
			str += @c 
			nextCh()
		end 
		tok = Token.new(Token::WS,str) 
	elsif 
		nextCh() 
		# don't want to give back nil token!
		tok = Token.new("unknown","unknown") 
	end 
	#more needed here...
	return tok
end
end
def letter?(lookAhead)  
	lookAhead =~ /[a-z]|[A-Z]/ 
end 
def numeric?(lookAhead)
   lookAhead =~ /^(\d)+$/ 
end 
def whitespace?(lookAhead)
   lookAhead =~ /^(\s)+$/ 
end 