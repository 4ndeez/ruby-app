# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Report do
  subject(:report) { described_class.new(hash) }

  let(:path) { 'spec/fixtures/webserver.log' }
  let(:hash) do
    { '/help_page/1' => ['126.318.035.038', '126.318.035.038', '126.318.035.038'],
      '/index' => ['444.701.448.104', '444.701.448.104'],
      '/about' => ['061.945.150.735'] }
  end

  before { allow($stdout).to receive(:puts) }

  describe '#most_page_views' do
    subject(:most_page_views) { report.most_page_views }

    let(:expected_result) do
      { '/help_page/1' => ['126.318.035.038', '126.318.035.038', '126.318.035.038'],
        '/index' => ['444.701.448.104', '444.701.448.104'],
        '/about' => ['061.945.150.735'] }
    end

    it 'returns correct and ordered hash' do
      expect(most_page_views).to eq(expected_result)
    end

    it 'prints output to terminal' do
      expect { most_page_views }.to output(<<~MESSAGE).to_stdout
            MOST VIEWED PAGES
        /help_page/1   3 visits
        /index         2 visits
        /about         1 visits
      MESSAGE
    end
  end

  describe '#most_unique_views' do
    subject(:most_unique_views) { report.most_unique_views }

    let(:expected_result) do
      { '/help_page/1' => ['126.318.035.038'],
        '/index' => ['444.701.448.104'],
        '/about' => ['061.945.150.735'] }
    end

    it 'returns correct and ordered hash' do
      expect(most_unique_views).to eq(expected_result)
    end

    it 'prints output to terminal' do
      expect { most_unique_views }.to output(<<~MESSAGE).to_stdout
            MOST UNIQUE PAGE VIEWS
        /about         1 unique views
        /index         1 unique views
        /help_page/1   1 unique views
      MESSAGE
    end
  end
end
