# frozen_string_literal: true
module Report
  UNDERLINE = ('_' * 40)

  def generate_report(links)
    most_page_views(links)
    most_unique_views(links)
  end

  private

  def most_page_views(links)
    puts UNDERLINE
    puts "        MOST VIEWED PAGES BY DESC"
    puts UNDERLINE
    links.sort_by { |_k, v| v.size }.reverse.to_h.each_pair { |k, v| puts k.ljust(15) + "#{v.size} visits" }
    puts UNDERLINE
  end

  def most_unique_views(links)
    puts "     MOST UNIQUE PAGE VIEWS BY DESC"
    puts UNDERLINE
    links.sort_by { |_k, v| v.uniq!.size }.reverse.to_h.each_pair { |k, v| puts k.ljust(15) + "#{v.size} unique views" }
    puts UNDERLINE
  end
end
