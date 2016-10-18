json.extract! question, :id, :user_id, :assignment_id, :translation_id, :title, :text, :created_at, :updated_at
json.url question_url(question, format: :json)