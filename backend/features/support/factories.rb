FactoryBot.define do
  factory :taker, class: 'User' do
    first_name { "Taker" }
    last_name { "User" }
    address { "123 Main St" }
    organization_name { "Taker Org" }
    organization_type { 0 }
    phone_number { "1234567890" }
    email { "taker@example.com" }
    password { "password" }
    role { 0 } # Taker role
    status { 0 }
  end

  factory :giver, class: 'User' do
    first_name { "Giver" }
    last_name { "User" }
    address { "456 Elm St" }
    organization_name { "Giver Org" }
    organization_type { 1 }
    phone_number { "0987654321" }
    email { "giver@example.com" }
    password { "password" }
    role { 1 } # Giver role
    status { 0 }
  end

  factory :request do
    title { "School Supplies" }
    description { "Requesting supplies for students." }
    item_name { "School Supplies" }
    quantity { 10 }
    category { :clothing }
    address { "123 Taker Street" }
    start_time { Time.now }
    end_time { Time.now + 7.days }
  end

  factory :interest do
    request_id { FactoryBot.create(:request).id }
    user_id { FactoryBot.create(:giver).id }
    quantity { 5 }
    delivery_method { 1 } # Example: 1 for shipping, 2 for pickup
    status { "pending" }
  end

  factory :json_file do
    name { "sample.json" }
    file_path { "/path/to/sample.json" }
  end
end
