class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def method_missing(provider)
    if !User.omniauth_providers.index(provider).nil?
      omniauth = env["omniauth.auth"]

      if current_user #or User.find_by_email(auth.recursive_find_by_key("email"))
        if current_user.user_tokens.where(:provider => omniauth['provider'],
                                          :uid => omniauth['uid']).first.nil?
          current_user.user_tokens.create(:provider => omniauth['provider'],
                                         :uid => omniauth['uid']).first.nil?
        end

        flash[:notice] = "Authentication successful"
        redirect_to edit_user_registration_path
      else
        authentication = User.where('user_tokens.provider' => omniauth['provider'],
                                    'user_tokens.uid' => omniauth['uid']).first

        if authentication
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
          sign_in_and_redirect(authentication, :event => :authentication)
        else

          #create a new user
          unless omniauth['user_info']['email'].blank?
            user = User.find_or_initialize_by_email(:email => omniauth['user_info']['email'])
          else
            user = User.new
          end

          user.apply_omniauth(omniauth)

          if user.save!
            flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
            sign_in_and_redirect(user, :event => :authentication)
          else
            session[:omniauth] = omniauth.except('extra')
            redirect_to new_user_registration_url
          end
        end
      end
    end
  end

end
