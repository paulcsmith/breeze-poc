class Breeze::Requests::IndexPage < BreezeLayout
  needs breeze_requests : BreezeRequestQuery

  def content
    h1 "All requests"
    ul do
      @breeze_requests.each do |request|
        li { link request.path, Show.with(request.id) }
      end
    end
  end
end
