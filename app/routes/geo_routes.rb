class GeoRoutes < Application
  post '/' do
    geocode_params = validate_with!(GeocodeParamsContract)
    coordinates = Geocoder.geocode(geocode_params[:city])

    if coordinates.present?
      status 201
      json coordinates: coordinates
    else
      status 422
      error_response I18n.t(:invalid_city, scope: 'services.geocode_service')
    end    
  end
end
