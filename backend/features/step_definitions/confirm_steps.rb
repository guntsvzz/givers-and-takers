Given("I am signed in as a taker for request") do
  @taker ||= FactoryBot.create(:taker)
  login_as(@taker, scope: :user)
end

When("I check activities for my request {string}") do |title|
  @request = Request.find_by(title: title) || FactoryBot.create(:request, title: title, taker: @taker)
  visit request_path(@request)
end

When("I confirm the donation from the giver") do
  @interest = FactoryBot.create(:interest, request: @request, user: FactoryBot.create(:giver))
  visit confirm_donation_request_interest_path(@request, @interest)
  click_button "Confirm Donation"
end

Then("I should see {string}") do |message|
  expect(page).to have_content(message)
end
