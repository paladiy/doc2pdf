module Paths
  PROJECT_PATH = "/Users/paladiy/development/ruby/doc2pdf"
  FORMATS = %W( doc docx odt sxw rtf wpd txt html ods sxc odp sxi ppt odg)
  SOURCE_PATH =  "#{PROJECT_PATH}/stack"
  ORIGIN_PATH = "#{PROJECT_PATH}/files"
  JODCONVERTER = "java -jar #{PROJECT_PATH}/jodconverter/lib/jodconverter-core-3.0-beta-3.jar"
  def origin_path(file)
    "#{ORIGIN_PATH}/#{Time.now.strftime("%Y-%m-%d")}/#{file}"
  end
  def origin_file_path(file)
    Dir.glob("#{origin_path(file)}/*.{#{FORMATS.join(',')}}").first.first
  end
  def pdf_file_name(file)
    "#{origin_file_path(file).scan(/.+\/(.+)\..+/).first.first}.pdf"
  end
  def pdf_file_path(file)  
    "#{origin_path(file)}/#{pdf_file_name(file)}"
  end
end