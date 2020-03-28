class Breeze::Requests::ShowPage < BreezeLayout
  needs breeze_request : BreezeRequest

  def page_title : String
    "Request Details"
  end

  def req : BreezeRequest
    breeze_request
  end

  def breadcrumb_parent
    link "All Requests", to: Index, class: "border-b-2 border-green-400 hover:text-teal-700"
    mount ArrowSvg.new("mx-1 mb-1 h-5 w-5 text-gray-400 inline-block")
  end

  def content
    mount RequestDescriptionList.new(breeze_request)
  end
end
