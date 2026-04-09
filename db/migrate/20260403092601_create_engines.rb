class CreateEngines < ActiveRecord::Migration[8.0]
  def change
    create_table :engines do |t|
      t.string :name, null: false
      t.string :deploy_command, null: false
      t.string :status_command, null: false
      t.string :upgrade_command, null: false
      t.string :restart_command, null: false
      t.string :destroy_command, null: false
      t.timestamps
    end

    add_index :engines, :name, unique: true
  end
end
