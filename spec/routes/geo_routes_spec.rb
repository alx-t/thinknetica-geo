RSpec.describe GeoRoutes, type: :routes do
  describe 'POST /' do
    context 'valid params' do
      let!(:ad) { create :ad, city: 'Москва' }

      it 'returs :created' do
        post '/', id: ad.id
        expect(last_response.status).to eq(201)
      end
    end

    context 'invalid params' do
      let!(:ad) { create :ad }

      it 'returs an error' do
        post '/', id: ad.id

        expect(last_response.status).to eq(422)
        expect(response_body['errors']).to include(
          'detail' => 'Неправильное название города'
        )
      end      
    end

    context 'invalid ad' do
      it 'returs an error' do
        post '/', id: 9

        expect(last_response.status).to eq(422)
        expect(response_body['errors']).to include(
          'detail' => 'Ошибка получения объявления'
        )
      end      
    end    
  end
end