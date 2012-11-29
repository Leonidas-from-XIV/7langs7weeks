module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
	@csv_contents << row.chomp.split(', ')
      end
    end
    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
    def each
      @csv_contents.each do |row|
        yield CsvRow.new(@headers, row)
      end
    end
  end
end

class CsvRow
  def initialize(header, row)
    @mapping = Hash[header.zip row]
  end
  def method_missing(name)
    @mapping[name.to_s]
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each do |row|
  puts row.bar
end
