class Breeze::Requests::ShowPage < BreezeLayout
  needs breeze_request : BreezeRequest

  def page_title : String
    "Request Details"
  end

  def breadcrumb_parent
    link "All Requests", to: Index, class: "border-b-2 border-green-400 hover:text-teal-700"
    mount ArrowSvg.new("mx-1 mb-1 h-5 w-5 text-gray-400 inline-block")
  end

  def content
    render_data(@breeze_request)
  end

  def render_data(req)
    div class: "bg-white shadow overflow-hidden  sm:rounded-lg" do
      div class: "px-4 py-5 border-b border-gray-200 sm:px-6" do
        h3 class: "text-lg leading-6 font-medium text-gray-900" do
          text req.action
        end
        para class: "mt-1 max-w-2xl text-sm leading-5 text-gray-500" do
          mount HttpMethodBadge.new(req.method)
          text " #{req.path}"
        end
      end
      div class: "px-4 py-5 sm:p-0" do
        dl do
          div class: "sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6 sm:py-5" do
            dt class: "text-sm leading-5 font-medium text-gray-500" do
              text "HTTP Method"
            end
            dd class: "mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2" do
              text req.method
            end
          end
          div class: "mt-8 sm:mt-0 sm:grid sm:grid-cols-3 sm:gap-4 sm:border-t sm:border-gray-200 sm:px-6 sm:py-5" do
            dt class: "text-sm leading-5 font-medium text-gray-500" do
              text "Path"
            end
            dd class: "mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2" do
              text req.path
            end
          end
          div class: "mt-8 sm:mt-0 sm:grid sm:grid-cols-3 sm:gap-4 sm:border-t sm:border-gray-200 sm:px-6 sm:py-5" do
            dt class: "text-sm leading-5 font-medium text-gray-500" do
              text "Action"
            end
            dd class: "mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2" do
              text req.action
            end
          end
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
      end
    end
  end
end
