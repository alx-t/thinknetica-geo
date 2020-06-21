RSpec.describe GeoRoutes, type: :routes do
  describe 'POST /' do
    context 'valid params' do
      let(:city) { 'Москва' }

      it 'returs :created' do
        post '/', city: city
        expect(last_response.status).to eq(201)
        expect(response_body['coordinates']).to include(
          {
            'lat' => 55.7540471, 
            'lon' => 37.620405
          }
        )
      end
    end

    context 'invalid params' do
      it 'returs an error' do
        post '/', city: 'invalid'

        expect(last_response.status).to eq(422)
        expect(response_body['errors']).to include(
          'detail' => 'Неправильное название города'
        )
      end      
    end
  end
end