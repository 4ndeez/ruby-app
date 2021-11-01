# frozen_string_literal: true
require_relative '../spec_helper'

RSpec.describe Document do
  let(:path) { '../fixtures/webserver.log' }
  subject { described_class.new(path) }

  describe '#initialize' do
    it 'assigns documents' do
      expect(subject.path).to eq(path)
    end

    it 'assigns links to an empty hash' do
      expect(subject.links).to eq(Hash.new)
    end
  end

  describe '#parse' do
    context 'with valid document' do
      it 'parses file and assign links' do
        subject.parse
        expect(subject.links['/contact']).not_to be_empty
      end
    end

    context 'with invalid document' do
      let(:invalid_path) { '../fixtures/missing.txt' }

      it 'raises an error' do
        expect { described_class.new(invalid_path).parse }.to raise_error(IOError), 'File not exist'
      end
    end
  end

  describe '#valid?' do
    context 'with valid document' do
      it 'returns true' do
        expect(described_class.new('../fixtures/webserver.log').valid?).to eq(true)
      end
    end

    context 'with invalid document' do
      it 'raise file not found error' do
        expect { described_class.new('missing.log').valid? }.to raise_error(IOError), 'File not exist'
      end

      it 'raise file is empty error' do
        expect { described_class.new('../fixtures/empty.log').valid? }
          .to raise_error(IOError), 'File is empty'
      end

      it 'raise file has incorrect format error' do
        expect { described_class.new('../fixtures/incorrect.txt').valid? }
          .to raise_error(IOError), 'File has incorrect format'
      end
    end
  end
end