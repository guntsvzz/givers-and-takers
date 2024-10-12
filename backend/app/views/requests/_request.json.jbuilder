json.extract! request, :id, :request_id, :taker_id, :image, :description, :item_name, :quantity, :status, :created_at, :updated_at
json.url request_url(request, format: :json)
