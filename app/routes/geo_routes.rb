class GeoRoutes < Application
  post '/' do
    p '---> params'
    p params
    geocode_params = validate_with!(GeocodeParamsContract)

    result = Geocoder::UpdateService.call(*geocode_params.to_h.values)

    if result.success?
      status 201
    else
      status 422
      error_response result.errors
    end    
  end
end
