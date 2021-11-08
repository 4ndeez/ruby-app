# frozen_string_literal: true

class Document
  attr_reader :path, :errors

  def initialize(path)
    @path = path
    @errors ||= []
    @links = Hash.new { |key, value| key[value] = [] }
  end

  def links
    raise IOError, errors unless valid?

    IO.foreach(path) do |line|
      path, ip = line.split
      @links[path] << ip
    end
    @links
  end

  def valid?
    exist? && fine_format? && !empty?
  end

  private

  def exist?
    return true if File.exist?(path)

    errors.push('File does not exist')
    false
  end

  def empty?
    return false unless File.zero?(path)

    errors.push('File is empty')
    true
  end

  def fine_format?
    return true if File.extname(path) == '.log'

    errors.push('File has incorrect format')
    false
  end
end
