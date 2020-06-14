class GeocodeParamsContract < Dry::Validation::Contract
  params do
    required(:id).filled(:integer)
  end
end
