require 'test/unit'
load 'lib/LYPHtml.rb'


class TestHTML < Test::Unit::TestCase

def test_ejemplo_clase

a = Rhtml.new {
	html {
		head(:dir => "chazam", :lang => "spanish") { title "My wonderful home page" }
		body do
			h1 "Welcome to my home page!", :class => "chuchu", :lang => "spanish"
			b "My hobbies:"
			ul do
				li "Juggling"
				li "Knitting"
				li "Metaprogramming"
			end #ul
		end # body
	}
}


resultado =<<-DELIMHTML
<html>
<head dir = "chazam" lang = "spanish">
<title>
My wonderful home page
</title>
</head>
<body>
<h1 class = "chuchu" lang = "spanish">
Welcome to my home page!
</h1> <b>
My hobbies:
</b> <ul>
<li>
Juggling
</li> <li>
Knitting
</li> <li>
Metaprogramming
</li>
</ul>
</body>
</html>
DELIMHTML

b = a.to_s.gsub( /\s+/ , '' )
resul = resultado.gsub( /\s+/ , '' )
assert_equal b, resul

s = a.to_s
assert_match(/head dir = "chazam"/, s)
assert_match(/lang = "spanish"/, s)
assert_match(/Welcome to my home page!/, s)

end



end