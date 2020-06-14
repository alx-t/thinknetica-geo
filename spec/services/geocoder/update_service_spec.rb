RSpec.describe Geocoder::UpdateService do
  RSpec::Matchers.define_negated_matcher :not_change, :change

  subject { described_class }

  context 'valid params' do
    let!(:ad) { create :ad, city: 'Москва' }

    it 'updates lat & lon of ad' do
      expect { subject.call(ad.id) }
      .to change { ad.reload.lat }.from(nil).to(Float)
      .and change { ad.lon }.from(nil).to(Float)
    end
  end

  context 'invalid city' do
    let!(:ad) { create :ad }

    it 'nothing changed' do
      expect { subject.call(ad.id) }
        .to not_change { ad.reload.lat }
        .and not_change { ad.lon }
    end
  end
end