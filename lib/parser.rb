require 'lib/stemmable'
require "lib/doc"

  STOP_WORDS = %w[
      a b c d e f g h i j k l m n o p q r s t u v w x y z
      an and are as at be by for from has he in is it its
      of on that the to was were will with upon without among
    ]
    
def parse(file)
  raise 'NoFileGiven' unless file
  
  
  regexp = /^\.([A-Z]) (\d*)|^\.([A-Z])|(^[^\.].*)/

  # $1 Existe un indice
  # $2 Numero de Indice
  # $3 Atributo
  # $4 Contenido de Atributo

  @docs = []
  print "Parsing...\n"
  until file.eof? do
    if file.gets =~ regexp
      
      if $1 and $2
        @docs << @doc if @doc
        @doc = Doc.new();
        @doc.send ($1.to_s << "=").to_sym, $2
      end
          
      if $3
        @doc.send ($3.to_s << "<<").to_sym, $4
        @doc.temp = $3.to_s.downcase
      end
      
      if $4
        @doc.send (@doc.temp + "<<").to_sym, $4
      end      
    end  # regexp match
  end #file.gets
  file.close

  print "Parsing: Done\n"  
  
  print "Terms Definition...\n"
  
  for doc in @docs      
    doc.terms = doc.w.to_s.gsub(/\W+/, ' ').split(' ').map{|w| w.stem }.uniq
    doc.terms.reject! { |term| STOP_WORDS.include?(term) }
  end
  print "Terms Definition: Done\n"
  
  @docs
end
