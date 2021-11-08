#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../config/environment'

doc = Document.new(ARGV[0])

report = Report.new(doc.links)
report.most_page_views
report.most_unique_views
