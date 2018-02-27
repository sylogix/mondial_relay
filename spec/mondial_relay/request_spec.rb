# frozen_string_literal: true

RSpec.describe MondialRelay::Request do
  let(:request) { build(:request) }

  describe '#attributes' do
    subject { request.attributes }

    it 'has an xmlns attribute' do
      expect(subject).to include(:xmlns)
    end
  end

  describe '#message' do
    subject { request.message }

    let(:mandatory_options) { %i[Enseigne Security] }

    it 'has mandatory options' do
      expect(subject).to include(*mandatory_options)
    end

    it 'includes all parameters' do
      expect(subject).to include(*request.params.keys)
    end

    it ':Enseigne is the first option' do
      expect(subject.keys.first).to eq(:Enseigne)
    end

    it ':Security is the first option' do
      expect(subject.keys.last).to eq(:Security)
    end
  end
end
