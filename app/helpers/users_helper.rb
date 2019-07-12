module UsersHelper
	def user_params
		params.require(:user).permit(:user_name)
	end
end
