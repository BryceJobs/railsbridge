module ApplicationHelper
	def is_active?(link_path)
		current_page?(link_path) ? "active":""
	end

	def set_active(controlparam)
		controller.controller_name.eql?(controlparam) ? "active":""
	end
end
