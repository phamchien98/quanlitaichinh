module ApplicationHelper
	def current_class?(test_path)
    return 'w3-bar-item w3-button root-active' if request.path == test_path
    'w3-bar-item w3-button'
  end
end
