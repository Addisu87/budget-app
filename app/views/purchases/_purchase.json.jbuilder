json.extract! purchase, :id, :name, :amount, :author_id, :category_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
