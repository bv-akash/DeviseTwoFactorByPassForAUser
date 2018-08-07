class RememberMeController < ApplicationController

	def remember
		@user = current_user
		cookies[:user_details] = { :value => SecureRandom.hex, :expires => 7.days.from_now  }
		@user.no_otp = cookies[:user_details]
		@user.save!
		redirect_to root_path
	end

	def forget
		@user = current_user
		cookies.delete :user_details
		@user.no_otp=nil
		@user.save!
		redirect_to root_path
	end

end
