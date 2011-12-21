#!/usr/bin/env ruby


class Rhtml

def initialize (&b)
	@p = [[]]
	instance_eval &b
end

def build_attr(h)
	return '' if h.nil? or h.empty?
	h.inject('') {|a, i| a = a + %<#{i[0]} = "#{i[1]}" >}
end

def method_missing(tag, *args)
	if block_given?
		@p.push []
		yield
		text = @p.pop.join(' ')
	else #cadena
		text = args.shift
	end
	textattr = build_attr(args.shift)
	text = "<#{tag} #{textattr}>#{text}</#{tag}>\n" 
	@p[-1].push(text)
	text
end

def to_s
	@p.to_s
end

end


if __FILE__ == $0
   q= Rhtml.new {  
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
  puts q
end


#José Isaac Hernández Quintero