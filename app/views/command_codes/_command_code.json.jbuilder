json.extract! command_code, :id, :title, :overview, :body, :description, :path, :lang_id, :created_at, :updated_at
json.url command_code_url(command_code, format: :json)
