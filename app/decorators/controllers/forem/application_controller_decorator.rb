Forem::ApplicationController.class_eval do
  skip_before_filter :auth
  before_filter :authenticate_forem_user
  def authenticate_forem_user
    if !forem_user   
      if current_user.blank?
        redirect_to main_app.new_user_path
      end
    end
  end
end
