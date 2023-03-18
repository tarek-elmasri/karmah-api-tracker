Rails.application.config.middleware.insert_before 0, Rack::Cors do
  if Rails.env == "development"
    allow do
      origins 'http://localhost:8000'

      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  elsif Rails.env == "production" 
    allow do
      origins 'http://localhost:8000'

      resource '*',
        headers: :any, # TODO: add spescific headers
        methods: [:get, :post, :put, :patch, :delete, :options, :head] 
    end
  end
end