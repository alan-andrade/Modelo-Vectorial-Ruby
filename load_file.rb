def load_file(file_name)
  size = File.size(file_name.to_s)
  print "File: #{file_name.to_s}\nWeight: #{((size/1024).to_f/1024).to_f} Mb\nLoading...\n"
  open(file_name.to_s)
end
