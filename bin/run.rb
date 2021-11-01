#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../config/environment'

Document.new(ARGV[0]).parse
