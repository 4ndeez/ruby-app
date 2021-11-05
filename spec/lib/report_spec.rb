# frozen_string_literal: true
require_relative '../spec_helper'

RSpec.describe Report do
  let(:path) { 'spec/fixtures/webserver.log' }
  let(:document) { Document.new(path) }
  before { document.parse }
  subject { described_class.new(document.links) }

  describe '#initialize' do
    it 'assigns links to not empty hash' do
      document.parse
      expect(subject.links).not_to be_empty
    end
  end

  describe '#most_page_views' do
    let(:result) do
      { '/about' => 19,
        '/home' => 19,
        '/help_page/1' => 18,
        '/about/2' => 17,
        '/contact' => 16,
        '/index' => 11 }
    end

    it 'returns correct and ordered hash' do
      expect(subject.most_page_views.transform_values { |v| v.size }).to eq(result)
    end
  end

  describe '#most_unique_views' do
    let(:result) do
      { '/about' => 13,
        '/home' => 14,
        '/help_page/1' => 12,
        '/about/2' => 12,
        '/contact' => 10,
        '/index' => 10 }
    end

    it 'returns correct and ordered hash' do
      expect(subject.most_unique_views.transform_values { |v| v.size }).to eq(result)
    end
  end
end

