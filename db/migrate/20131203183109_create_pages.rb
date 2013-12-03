class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :about_title
      t.text :about_content
      t.string :contact_title
      t.text :contact_content

      t.timestamps
    end
  end
end
