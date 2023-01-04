json.extract! snippet_code, :id, :code, :overview, :description, :path, :lang_id, :snippet_id, :created_at, :updated_at
json.url snippet_code_url(snippet_code, format: :json)
