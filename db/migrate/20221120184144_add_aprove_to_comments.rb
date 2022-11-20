class AddAproveToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :aprove, :boolean, default: false
  end
end
