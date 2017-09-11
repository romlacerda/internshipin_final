json.extract! answer, :id, :descricao, :user_id, :topic_id, :created_at, :updated_at, :answer_id
json.url answer_url(answer, format: :json)
