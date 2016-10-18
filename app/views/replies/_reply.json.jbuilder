json.extract! reply, :id, :user_id, :question_id, :text, :created_at, :updated_at
json.url reply_url(reply, format: :json)