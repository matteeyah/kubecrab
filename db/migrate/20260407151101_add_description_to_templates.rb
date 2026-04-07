# frozen_string_literal: true

class AddDescriptionToTemplates < ActiveRecord::Migration[8.0]
  def change
    add_column :templates, :description, :text, default: "", null: false
    add_column :templates, :instruction, :text, default: "", null: false
  end
end
