json.array!(@letterings) do |lettering|
  json.extract! lettering, :id, :name
  json.url lettering_url(lettering, format: :json)
end
