class CreateTemplateOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :template_options do |t|
      t.string :name, null: false
      t.references :template, null: false, foreign_key: true
      t.timestamps
    end

    add_index :template_options, %i[name template_id], unique: true
  end
end
