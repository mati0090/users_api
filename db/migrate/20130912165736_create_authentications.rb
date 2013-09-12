class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :uuid
      t.string :secret_token
      t.references :user

      t.timestamps
    end
  end
end
