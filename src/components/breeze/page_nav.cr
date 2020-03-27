class Breeze::PageNav < BaseComponent
  needs pages : Lucky::Paginator

  def render
    div aria_label: "pagination", role: "navigation", class: "bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6" do
      div class: "hidden sm:flex-1 sm:flex sm:items-center sm:justify-between" do
        page_metadata
        next_and_previous_links_for_small_screens

        div do
          span class: "relative z-0 inline-flex shadow-sm" do
            prev_arrow_link
            page_links
            next_arrow_link
          end
        end
      end
    end
  end

  def page_links
    @pages.series(begin: 2, left_of_current: 1, right_of_current: 1, end: 2).each do |item|
      render_page_item(item)
    end
  end

  def render_page_item(page : Lucky::Paginator::Page)
    a page.number, href: page.path,
      class: "-ml-px relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150"
  end

  def render_page_item(page : Lucky::Paginator::CurrentPage)
    span page.number,
      class: "-ml-px relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150"
  end

  def render_page_item(gap : Lucky::Paginator::Gap)
    span class: "-ml-px relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm leading-5 font-medium text-gray-700" do
      text " ... "
    end
  end

  def prev_arrow_link
    a href: pages.path_to_next || "#", class: "relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm leading-5 font-medium text-gray-500 hover:text-gray-400 focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-100 active:text-gray-500 transition ease-in-out duration-150" do
      tag "svg", class: "h-5 w-5", fill: "currentColor", viewBox: "0 0 20 20" do
        tag "path",
          clip_rule: "evenodd",
          d: "M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z",
          fill_rule: "evenodd"
      end
    end
  end

  def next_arrow_link
    a href: pages.path_to_previous || "#", class: "-ml-px relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm leading-5 font-medium text-gray-500 hover:text-gray-400 focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-100 active:text-gray-500 transition ease-in-out duration-150" do
      tag "svg", class: "h-5 w-5", fill: "currentColor", viewBox: "0 0 20 20" do
        tag "path", clip_rule: "evenodd", d: "M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z", fill_rule: "evenodd"
      end
    end
  end

  def next_and_previous_links_for_small_screens
    div class: "flex-1 flex justify-between sm:hidden" do
      prev_path = @pages.path_to_previous
      a "Previous",
        href: prev_path || "#",
        class: "relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm leading-5 font-medium rounded-md text-gray-700 bg-white hover:text-gray-500 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150"
      a class: "relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm leading-5 font-medium rounded-md text-gray-700 bg-white hover:text-gray-500 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150", href: "#" do
        text " Previous "
      end
      a class: "ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm leading-5 font-medium rounded-md text-gray-700 bg-white hover:text-gray-500 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150", href: "#" do
        text " Next "
      end
    end
  end

  def page_metadata
    div do
      para class: "text-sm leading-5 text-gray-700" do
        range = pages.item_range
        text " Showing "
        span range.begin, class: "font-medium"
        text " to "
        span range.end, class: "font-medium"
        text " of "
        span pages.item_count, class: "font-medium"
        text " results "
      end
    end
  end
end
