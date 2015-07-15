json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :is_online, :image
  json.url product_url(product, format: :json)
end
