# frozen_string_literal: true

class Document
  attr_reader :path, :links, :errors

  def initialize(path)
    @path = path
    @links = Hash.new { |key, value| key[value] = [] }
    @errors ||= []
    valid?
  end

  def parse
    IO.foreach(path) do |line|
      path, ip = line.split
      links[path] << ip
    end
  end

  def valid?
    exist? && fine_format? && !empty?
    errors.any? ? (raise IOError, errors) : true
  end

  private

  def exist?
    return true if File.exist?(path)

    errors.push('File does not exist')
    false
  end

  def empty?
    errors.push('File is empty') if File.zero?(path)
  end

  def fine_format?
    return true if File.extname(path) == '.log'

    errors.push('File has incorrect format')
    false
  end
end
