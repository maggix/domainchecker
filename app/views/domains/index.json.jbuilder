json.array!(@domains) do |domain|
  json.extract! domain, :id, :host, :user_id, :expiration_date
  json.url domain_url(domain, format: :json)
end
