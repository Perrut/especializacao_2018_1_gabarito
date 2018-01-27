json.extract! usuario, :id, :nome, :sobrenome, :email, :telefone, :data_nascimento, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
