class Breeze::Requests::IndexPage < BreezeLayout
  needs breeze_requests : BreezeRequestQuery

  def page_title
    "All Requests"
  end

  def content
    render_table
  end

  def render_table
    div class: "bg-white shadow overflow-hidden sm:rounded-md" do
      ul do
        @breeze_requests.each do |req|
          request_row(req)
        end
      end
    end
  end

  def request_row(req)
    li class: "border-t border-gray-200" do
      link class: "block hover:bg-gray-50 focus:outline-none focus:bg-gray-50 transition duration-150 ease-in-out", to: Show.with(req.id) do
        div class: "flex items-center px-4 py-4 sm:px-4" do
          div class: "min-w-0 flex-1 flex items-center" do
            div class: "min-w-0 flex-1 px-4 md:grid md:grid-cols-3 md:gap-4" do
              div do
                div req.action, class: "text-sm leading-5 font-medium text-teal-500 truncate"
              end
              div class: "hidden md:block" do
                div do
                  div class: "text-sm leading-5 text-gray-900" do
                    span class: "inline-flex items-center px-2.5 py-0.5 rounded-md text-xs font-medium leading-5 bg-gray-100 text-gray-800" do
                      text req.method.upcase
                    end
                    text " #{req.path}"
                  end
                end
              end
              div class: "hidden md:block" do
                div do
                  div class: "text-sm leading-5 text-gray-900" do
                    text "#{time_ago_in_words(req.created_at)} ago"
                  end
                end
              end
            end
          end
          div do
            row_arrow
          end
        end
      end
    end
  end

  def row_arrow
    tag "svg", class: "h-5 w-5 text-gray-400", fill: "currentColor", viewBox: "0 0 20 20" do
      tag "path", clip_rule: "evenodd", d: "M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z", fill_rule: "evenodd"
    end
  end
end
