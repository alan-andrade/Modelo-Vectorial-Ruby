class Doc  
  def initialize
    @attributes = {}
  end
  
  def method_missing(name, *args)
    method = name.to_s.downcase
    if method =~ /=$/
      @attributes[method.chop] = args[0]
    elsif method =~ /<<$/
      method = method.chop.chop
      @attributes[method] = "" if send(method).nil?
      @attributes[method] << (args[0] || "")
    else
      @attributes[method]
    end
  end
  
  def to_s
    @attributes.each{|a| print "#{a.first}: #{a.last}\n"}
  end
end

