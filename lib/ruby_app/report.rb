# frozen_string_literal: true

class Report
  attr_reader :links

  def initialize(links)
    @links = links
  end

  def most_page_views
    puts '    MOST VIEWED PAGES'
    links.sort_by { |_k, v| v.size }.reverse.to_h.each_pair { |k, v| puts k.ljust(15) + "#{v.size} visits" }
  end

  def most_unique_views
    puts '    MOST UNIQUE PAGE VIEWS'
    links.transform_values(&:uniq)
         .sort_by { |_k, v| v.size }.reverse.to_h.each_pair { |k, v| puts k.ljust(15) + "#{v.size} unique views" }
  end
end
