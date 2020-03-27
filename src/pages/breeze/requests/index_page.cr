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
      a class: "block hover:bg-gray-50 focus:outline-none focus:bg-gray-50 transition duration-150 ease-in-out", href: "#" do
        div class: "flex items-center px-4 py-4 sm:px-6" do
          div class: "min-w-0 flex-1 flex items-center" do
            div class: "min-w-0 flex-1 px-4 md:grid md:grid-cols-2 md:gap-4" do
              div do
                div req.action, class: "text-sm leading-5 font-medium text-teal-500 truncate"
                # div class: "mt-2 flex items-center text-sm leading-5 text-gray-500" do
                #   span "ricardo.cooper@example.com", class: "truncate"
                # end
              end
              div class: "hidden md:block" do
                div do
                  div class: "text-sm leading-5 text-gray-900" do
                    text " Happened #{time_ago_in_words(req.created_at)} ago"
                  end
                  # div class: "mt-2 flex items-center text-sm leading-5 text-gray-500" do
                  #   tag "svg", class: "flex-shrink-0 mr-1.5 h-5 w-5 text-green-400", fill: "currentColor", viewBox: "0 0 20 20" do
                  #     tag "path", clip_rule: "evenodd", d: "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z", fill_rule: "evenodd"
                  #   end
                  #   text " Completed phone screening "
                  # end
                end
              end
            end
          end
          div do
            tag "svg", class: "h-5 w-5 text-gray-400", fill: "currentColor", viewBox: "0 0 20 20" do
              tag "path", clip_rule: "evenodd", d: "M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z", fill_rule: "evenodd"
            end
          end
        end
      end
    end
  end
end
