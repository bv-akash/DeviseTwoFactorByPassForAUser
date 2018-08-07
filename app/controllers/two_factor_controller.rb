class TwoFactorController < ApplicationController

	def activate
		current_user.otp_required_for_login = true
		current_user.otp_secret = User.generate_otp_secret
		current_user.save!
		@qr_code_img = RQRCode::QRCode.new(two_factor_url).to_img.resize(240, 240).to_data_url
		@qr_code_key = current_user.otp_secret
	end

	def deactivate
	end

	def disable
		@user=current_user
		if @user.valid_password?(params[:confirm][:password])
			if @user.otp_required_for_login == true
				@user.otp_required_for_login = false
				@user.otp_secret = nil
				@user.no_otp = nil
				@user.save!
			end
			redirect_to root_path
		else
			redirect_to two_factor_deactivate_path, flash: {message: "Incorrect Password !!"}
		end
	end

	def two_factor_url
		app_id = "BlogVault"
		app_name = "Two Factor Login"
		"otpauth://totp/#{app_id}:#{current_user.email}?secret=#{current_user.otp_secret}&issuer=#{app_name}"
	end
end
