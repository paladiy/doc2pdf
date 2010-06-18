require 'rubygems'
require 'daemons'
require 'fileutils'
require 'paths'
dir = File.expand_path(File.join(File.dirname(__FILE__)))
daemon_options = {
  :multiple   => false,
  :dir_mode   => :normal,
  :dir        => File.join(dir, 'tmp'),
  :backtrace  => true,
  :log_output => true
}
include Paths
Daemons.run_proc('doc2pdf', daemon_options) do
  loop do
    files = Dir.glob("#{SOURCE_PATH}/*")    
    files.each do |file|             
      file = file.scan(/.+\/(\d+)/).first.first
      system "#{JODCONVERTER} #{origin_file_path file}  #{pdf_file_path file}"
      if File.exist?("#{pdf_file_path file}")
        FileUtils.rm "#{SOURCE_PATH}/#{file}"
      end
    end
    sleep 5
  end
end
