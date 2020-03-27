class Breeze::SmallSidebar < BaseComponent
  def render
    div class: "md:hidden", x_show: "sidebarOpen" do
      div "@click": "sidebarOpen = false", class: "fixed inset-0 z-30 transition-opacity ease-linear duration-300", "x-transition:enter-end": "opacity-100", "x-transition:enter-start": "opacity-0", "x-transition:leave-end": "opacity-0", "x-transition:leave-start": "opacity-100", x_show: "sidebarOpen" do
        div class: "absolute inset-0 bg-gray-600 opacity-75"
      end
      div class: "fixed inset-0 flex z-40" do
        div class: "flex-1 flex flex-col max-w-xs w-full bg-white transform ease-in-out duration-300 ", "x-transition:enter-end": "translate-x-0", "x-transition:enter-start": "-translate-x-full", "x-transition:leave-end": "-translate-x-full", "x-transition:leave-start": "translate-x-0", x_show: "sidebarOpen" do
          div class: "absolute top-0 right-0 -mr-14 p-1" do
            button "@click": "sidebarOpen = false", class: "flex items-center justify-center h-12 w-12 rounded-full focus:outline-none focus:bg-gray-600", x_show: "sidebarOpen" do
              tag "svg", class: "h-6 w-6 text-white", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                tag "path", d: "M6 18L18 6M6 6l12 12", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
              end
            end
          end
          div class: "flex-1 h-0 pt-5 pb-4 overflow-y-auto" do
            # div class: "flex-shrink-0 flex items-center px-4" do
            #   img alt: "Workflow", class: "h-8 w-auto", src: "/img/logos/workflow-logo-on-white.svg"
            # end
            nav class: "mt-5 px-2" do
              a class: "group flex items-center px-2 py-2 text-base leading-6 font-medium text-gray-900 rounded-md bg-gray-100 focus:outline-none focus:bg-gray-200 transition ease-in-out duration-150", href: "#" do
                tag "svg", class: "mr-4 h-6 w-6 text-gray-500 group-hover:text-gray-500 group-focus:text-gray-600 transition ease-in-out duration-150", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                  tag "path", d: "M3 12l9-9 9 9M5 10v10a1 1 0 001 1h3a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1h3a1 1 0 001-1V10M9 21h6", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                end
                text " Dashboard "
              end
              a class: "mt-1 group flex items-center px-2 py-2 text-base leading-6 font-medium text-gray-600 rounded-md hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-100 transition ease-in-out duration-150", href: "#" do
                tag "svg", class: "mr-4 h-6 w-6 text-gray-400 group-hover:text-gray-500 group-focus:text-gray-500 transition ease-in-out duration-150", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                  tag "path", d: "M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                end
                text " Team "
              end
              a class: "mt-1 group flex items-center px-2 py-2 text-base leading-6 font-medium text-gray-600 rounded-md hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-100 transition ease-in-out duration-150", href: "#" do
                tag "svg", class: "mr-4 h-6 w-6 text-gray-400 group-hover:text-gray-500 group-focus:text-gray-500 transition ease-in-out duration-150", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                  tag "path", d: "M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                end
                text " Projects "
              end
              a class: "mt-1 group flex items-center px-2 py-2 text-base leading-6 font-medium text-gray-600 rounded-md hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-100 transition ease-in-out duration-150", href: "#" do
                tag "svg", class: "mr-4 h-6 w-6 text-gray-400 group-hover:text-gray-500 group-focus:text-gray-500 transition ease-in-out duration-150", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                  tag "path", d: "M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                end
                text " Calendar "
              end
              a class: "mt-1 group flex items-center px-2 py-2 text-base leading-6 font-medium text-gray-600 rounded-md hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-100 transition ease-in-out duration-150", href: "#" do
                tag "svg", class: "mr-4 h-6 w-6 text-gray-400 group-hover:text-gray-500 group-focus:text-gray-500 transition ease-in-out duration-150", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                  tag "path", d: "M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                end
                text " Documents "
              end
              a class: "mt-1 group flex items-center px-2 py-2 text-base leading-6 font-medium text-gray-600 rounded-md hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-100 transition ease-in-out duration-150", href: "#" do
                tag "svg", class: "mr-4 h-6 w-6 text-gray-400 group-hover:text-gray-500 group-focus:text-gray-500 transition ease-in-out duration-150", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                  tag "path", d: "M16 8v8m-4-5v5m-4-2v2m-2 4h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                end
                text " Reports "
              end
            end
          end
        end
        div class: "flex-shrink-0 w-14" do
        end
      end
    end
  end
end
