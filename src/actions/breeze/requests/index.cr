class Breeze::Requests::Index < BrowserAction
  include Auth::AllowGuests

  get "/breeze" do
    html IndexPage, breeze_requests: BreezeRequestQuery.new
  end
end
