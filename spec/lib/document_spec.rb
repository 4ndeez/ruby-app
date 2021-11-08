# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Document do
  subject(:document) { described_class.new(path) }

  describe '#links' do
    context 'when valid document' do
      subject(:links) { document.links }

      let(:path) { 'spec/fixtures/webserver.log' }
      let(:expected_result) do
        { '/about' => ['061.945.150.735'],
          '/help_page/1' => ['126.318.035.038', '126.318.035.038', '126.318.035.038'],
          '/index' => ['444.701.448.104'] }
      end

      it 'parses file and assign links' do
        expect(links).to eq(expected_result)
      end
    end

    context 'when invalid document' do
      subject(:document) { described_class.new(invalid_path) }

      let(:invalid_path) { '../fixtures/missing.txt' }

      it 'raises an error' do
        expect { document.links }.to raise_error(IOError), 'File not exist'
      end
    end
  end

  describe '#valid?' do
    subject(:document) { described_class }

    context 'when valid document' do
      it { expect(document.new('spec/fixtures/webserver.log').valid?).to eq(true) }
    end

    context 'when invalid document' do
      it { expect(document.new('missing.log').valid?).to eq(false) }

      it { expect(document.new('../fixtures/empty.log').valid?).to eq(false) }

      it { expect(document.new('../fixtures/incorrect.txt').valid?).to eq(false) }
    end
  end
end
