class AddNoOtpToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :no_otp, :text
  end
end
