#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../config/environment'

doc = Document.new(ARGV[0])
doc.parse

report = Report.new(doc.links)

puts '        MOST VIEWED PAGES BY DESC'
report.most_page_views.each_pair { |k, v| puts k.ljust(15) + "#{v.size} visits" }
puts '_' * 40
puts '     MOST UNIQUE PAGE VIEWS BY DESC'
report.most_unique_views.each_pair { |k, v| puts k.ljust(15) + "#{v.size} unique views" }
