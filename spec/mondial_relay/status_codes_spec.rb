# frozen_string_literal: true

RSpec.describe MondialRelay::StatusCodes do

  describe '.success?' do
    subject { described_class.success?(status) }

    context 'on success' do
      let(:status) { 0 }

      it 'returns true' do
        expect(subject).to be_truthy
      end
    end

    context 'on failure' do
      let(:status) { 99 }

      it 'returns false' do
        expect(subject).to be_falsey
      end
    end

    context 'on tracking code' do
      let(:status) { 80 }

      it 'returns true' do
        expect(subject).to be_truthy
      end
    end
  end

  describe '.message_for' do
    let(:status) { 0 }

    subject { described_class.message_for(status) }

    it 'returns a corresponding status message' do
      expect(subject).to eq(MondialRelay::STATUS_CODES[status])
    end
  end
end
