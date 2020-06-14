module Geocoder
  class UpdateService
    prepend BasicService

    param :id
    option :ad, default: proc { Ad.first(id: id) }

    def call
      return fail!(I18n.t(:invalid_ad, scope: 'services.geocode_service')) if @ad.nil?
      
      coordinates = Geocoder.geocode(ad.city)
      return fail!(I18n.t(:invalid_city, scope: 'services.geocode_service')) if coordinates.blank?

      @ad.lat, @ad.lon = coordinates

      if @ad.valid?
        @ad.save
      else
        fail!(@ad.errors)
      end
    end
  end
end