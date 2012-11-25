require 'libxml'
include LibXML

class Parser
 include XML::SaxParser::Callbacks 

 def initialize
  #The Constructor
 end

 def on_start_element(element, attributes)
  if element.to_s == "catalog"
   puts "Catalog Started"
  end

  if element.to_s == "book"
   puts "ID : " + attributes["id"].to_s
  end

  if element.to_s == "author"
   @read_string = ""
  end

  if element.to_s == "title"
   @read_string = ""
  end

  if element.to_s == "genre"
   @read_string = ""
  end

  if element.to_s == "price"
   @read_string = ""
  end

  if element.to_s == "publish_date"
   @read_string = ""
  end

  if element.to_s == "description"
   @read_string = ""
  end
 end

 def on_cdata_block(cdata)
  puts "CDATA Found: " + cdata.to_s
 end

 def on_characters(chars)
  if @read_string != nil
   @read_string = @read_string + chars
  end
 end

 def on_end_element(element)
  if element.to_s == "catalog"
   puts "Catalog Ended"
  end

  if element.to_s == "book"
   puts "\n"
  end

  if element.to_s == "author"
   puts "Author :" + @read_string
   @read_string = nil
  end

  if element.to_s == "title"
   puts "Title :" + @read_string
   @read_string = nil
  end

  if element.to_s == "genre"
   puts "Genre :" + @read_string
   @read_string = nil
  end

  if element.to_s == "price"
   puts "Price :" + @read_string
   @read_string = nil
  end

  if element.to_s == "publish_date"
   puts "Publish Date :" + @read_string
   @read_string = nil
  end

  if element.to_s == "description"
   puts "Description :" + @read_string
   @read_string = nil
  end
 end

end

parser = XML::SaxParser.file("large_file.xml")
parser.callbacks = Parser.new
parser.parse


