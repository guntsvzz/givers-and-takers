json.extract! user, :id, :first_name, :last_name, :email, :citizen_id, :organization_name, :organization_type, :role, :username, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
