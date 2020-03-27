class Breeze::Requests::ShowPage < BreezeLayout
  needs breeze_request : BreezeRequest

  def content
    link "Back to all", to: Index
    h1 "Request"
    ul do
      li @breeze_request.path
    end
  end
end
