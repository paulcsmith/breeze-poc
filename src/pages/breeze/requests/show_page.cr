class Breeze::Requests::ShowPage < BreezeLayout
  needs breeze_request : BreezeRequest

  def page_title : String
    "Request Details"
  end

  def content
    link "Back to all", to: Index
    render_data(@breeze_request)
  end

  def render_data(req)
    div class: "bg-white shadow overflow-hidden  sm:rounded-lg" do
      div class: "px-4 py-5 border-b border-gray-200 sm:px-6" do
        h3 class: "text-lg leading-6 font-medium text-gray-900" do
          text req.action
        end
        para class: "mt-1 max-w-2xl text-sm leading-5 text-gray-500" do
          span class: "inline-flex items-center px-2.5 py-0.5 rounded-md text-xs font-medium leading-5 bg-gray-100 text-gray-800" do
            text req.method.upcase
          end
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
