json.extract! topic, :id, :titulo, :descricao, :user_id, :status, :tipo, :category_id, :subcategory_id, :created_at, :updated_at
json.url topic_url(topic, format: :json)