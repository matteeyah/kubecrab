module ApplicationHelper
  def current_controller?(path)
    path[1..].eql?(controller.controller_path)
  end
end
