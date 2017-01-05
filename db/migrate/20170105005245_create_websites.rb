class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :websites do |t|
      t.string :title
      t.text :image_name
      t.string :run_command
      t.string :container_id
      t.jsonb :run_options

      t.timestamps
    end
  end
end
