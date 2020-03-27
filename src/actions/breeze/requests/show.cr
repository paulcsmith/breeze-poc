class Breeze::Requests::Show < BrowserAction
  include Auth::AllowGuests

  route do
    html ShowPage, breeze_request: BreezeRequestQuery.find(request_id)
  end
end
