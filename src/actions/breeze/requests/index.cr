class Breeze::Requests::Index < BrowserAction
  include Auth::AllowGuests

  get "/breeze" do
    html IndexPage, breeze_requests: BreezeRequestQuery.new.created_at.desc_order
  end
end
