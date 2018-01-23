require 'pathname'
require 'io/console'

def is_directory_valid dir
  bool = (File.directory?(dir))? true : false
end

def is_file_valid filename
  bool = (File.file?(filename))? true : false
end

def count_bits pathname
  pn = Pathname.new(pathname)
  dir, basename = pn.split
  set_bits_counter = 0
  unset_bits_counter = 0

  if is_directory_valid(dir)
    if is_file_valid(pn)
      File.open(pn,'r') do|file|
        until file.eof?
          buffer = file.readchar.to_s.unpack("B*")[0]
          set_bits_counter+= buffer.count('1')
          unset_bits_counter+= buffer.count('0')
        end
        result = "found #{set_bits_counter}  bits set to 1,found #{unset_bits_counter} bits set to 0 "
      end
    else
      error = 'Given File is not a valid File.'
    end
  else
    error = 'Given directoory is not a valid direcotry.'
  end
end
