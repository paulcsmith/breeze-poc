# https://tailwindui.com/components/application-ui/data-display/description-lists#component-e1b5917b21bbe76a73a96c5ca876225f
abstract class Breeze::BaseDescriptionList < BaseComponent
  abstract def heading_title
  abstract def heading_subtitle
  abstract def list

  def render
    mount Breeze::Panel.new do
      render_main_heading
      render_list
    end
  end

  def render_main_heading
    div class: "px-4 py-5 border-b border-gray-200 sm:px-6" do
      h3 class: "text-lg leading-6 font-medium text-gray-900" do
        heading_title
      end
      div class: "mt-2" do
        heading_subtitle
      end
    end
  end

  def render_list
    div class: "px-4 py-5 sm:p-0" do
      dl do
        list
      end
    end
  end
end
