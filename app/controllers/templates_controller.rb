class TemplatesController < ApplicationController
  def index
    @templates = authorize(Template.active)
  end
end
