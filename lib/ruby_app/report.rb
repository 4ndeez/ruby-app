# frozen_string_literal: true
class Report
  attr_reader :links

  def initialize(links)
    @links = links
  end

  def most_page_views
    links.sort_by { |_k, v| v.size }.reverse.to_h
  end

  def most_unique_views
    links.sort_by { |_k, v| v.uniq!.size }.reverse.to_h
  end
end
