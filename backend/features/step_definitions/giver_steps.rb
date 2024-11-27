Given("I am signed up as a giver") do
  @giver = FactoryBot.create(:giver)
end

Given("I am signed in as a giver") do
  login_as(@giver, scope: :user)
end

When("I visit the requests page") do
  @request = FactoryBot.create(:request, title: "School Supplies", item_name: "School Supplies", quantity: 10)
  visit requests_path
end

When("I donate {int} items to {string}") do |quantity, item_name|
  @request = Request.find_by(item_name: item_name)
  raise "Request not found" if @request.nil? # Debugging step if request creation fails
  visit request_path(@request)
  fill_in "Quantity", with: quantity
  select "Shipping", from: "Delivery Method"
  click_button "Donate"
end

Then("I should see {string}") do |message|
  expect(page).to have_content(message)
end
