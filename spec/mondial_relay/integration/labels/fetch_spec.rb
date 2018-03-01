# frozen_string_literal: true

RSpec.xdescribe MondialRelay::Labels::Fetch, '.for' do
  it_behaves_like :query do
    let(:params) do
      { Expeditions: '31236189', Langue: 'FR' }
    end

    let(:response_keys) do
      %i[url_pdf_a4 url_pdf_a5 url_pdf_10x15]
    end
  end
end
