Forem::ApplicationController.class_eval do
  def authenticate_forem_user
    if !forem_user
      session["user_return_to"] = request.fullpath
      flash.alert = t("forem.errors.not_signed_in")
      devise_route = "new_#{Forem.user_class.to_s.underscore}_session_path"
      sign_in_path = Forem.sign_in_path ||
        (main_app.respond_to?(devise_route) && main_app.send(devise_route)) ||
        (main_app.respond_to?(:sign_in_path) && main_app.send(:sign_in_path))
      if sign_in_path
        redirect_to sign_in_path
      else
        redirect_to main_app.root_path
#         raise "Forem could not determine the sign in path for your application. Please do one of these things:

# 1) Define sign_in_path in the config/routes.rb of your application like this:

# or; 2) Set Forem.sign_in_path to a String value that represents the location of your sign in form, such as '/users/sign_in'."
      end
    end
  end
end
