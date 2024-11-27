Given("I am signed up as a taker") do
  @taker = FactoryBot.create(:taker, 
    first_name: "Taker", 
    last_name: "User", 
    address: "123 Taker Street", 
    organization_name: "Taker Org", 
    phone_number: "0987654321"
  )
end

Given("I am signed in as a taker") do
  login_as(@taker, scope: :user)
end

When("I make a request titled {string} with quantity {int}") do |title, quantity|
  visit new_request_path
  
  # Use dynamic id based on the request object id
  find(:xpath, "//input[@id='request_title_#{@request.object_id}']").set(title)
  
  fill_in "Description:", with: "Requesting supplies for students."
  fill_in "Enter your needed item:", with: "School Supplies"
  fill_in "Enter your goal set (Amount):", with: quantity
  select "Clothing", from: "request_category"  # Ensure "Clothing" is available in the category list
  fill_in "Address:", with: "123 Taker Street"
  fill_in "Start Time:", with: Time.now.strftime("%Y-%m-%d %H:%M")
  fill_in "End Time:", with: (Time.now + 7.days).strftime("%Y-%m-%d %H:%M")
  attach_file "Preview Image", Rails.root.join("spec/fixtures/files/sample_image.jpg")
  
  click_button "Make a Request"
end

Then("I should see {string}") do |message|
  expect(page).to have_content(message)
end
