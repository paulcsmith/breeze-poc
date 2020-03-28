require "./description_list"

class Breeze::RequestDescriptionList < Breeze::BaseDescriptionList
  needs req : BreezeRequest

  def heading_title
    text req.action
  end

  def heading_subtitle
    mount Breeze::Badge.new(req)
  end

  def list
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
