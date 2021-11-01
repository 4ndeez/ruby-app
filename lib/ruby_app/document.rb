# frozen_string_literal: true
class Document
  include Report
  attr_reader :path, :links

  def initialize(path)
    @path = path
    @links = Hash.new { |key, value| key[value] = [] }
  end

  def parse
    valid?
    IO.read(@path).split("\n").each do |line|
      path, ip = line.split
      @links[path] << ip
    end
    generate_report @links
  end

  def valid?
    exist? && !empty? && fine_format?
  end

  private

  def exist?
    File.exist?(@path) ? true : (raise IOError, 'File not exist')
  end

  def empty?
    raise IOError, 'File is empty' if File.zero?(@path)
  end

  def fine_format?
    File.extname(@path) == '.log' ? true : (raise IOError, 'File has incorrect format')
  end
end
