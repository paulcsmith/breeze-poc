class HttpMethodBadge < BaseComponent
  needs http_method : String

  def render
    span http_method,
      class: "inline-flex items-center px-2 py-0.5 rounded-md text-xs font-medium leading-5 bg-blue-100 tracking-wide text-blue-800"
  end
end
