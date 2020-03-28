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
    mount Breeze::DescriptionList.new(
      heading_title: ->{ text req.action },
      heading_subtitle: ->{ mount Breeze::Badge.new(req) },
      list: ->{ render_list }
    )
  end

  def render_list
    render_session_info
    render_header_info
  end

  def render_session_info
    req.session.as_h.each do |key, value|
      div class: "mt-8 sm:mt-0 sm:grid sm:grid-cols-3 sm:gap-4 sm:border-t sm:border-gray-200 sm:px-6 sm:py-5" do
        dt class: "text-sm leading-5 font-medium text-gray-500" do
          text "Session #{key}"
        end
        dd class: "mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2" do
          text value.as_s
        end
      end
    end
  end

  def render_header_info
    req.headers.as_h.each do |key, value|
      div class: "mt-8 sm:mt-0 sm:grid sm:grid-cols-3 sm:gap-4 sm:border-t sm:border-gray-200 sm:px-6 sm:py-5" do
        dt class: "text-sm leading-5 font-medium text-gray-500" do
          text "Header #{key}"
        end
        dd class: "mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2" do
          text value[0].as_s
        end
      end
    end
  end
end
