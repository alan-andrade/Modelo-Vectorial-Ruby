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
  #180.times do
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
    doc.terms = doc.w.to_s.gsub(/\W+/, ' ').split(' ').uniq.to_s
  end
  print "Terms Definition: Done\n"
  
  @docs
end
