class UserMailer < ActionMailer::Base

  default :from => Proc.new{ ['staging','production'].include?(Rails.env) ? "Interior Design <boyawards@interiordesign.net>" : "XOlator Dev <dev@xolator.com>" },
          :charset => 'UTF-8', 'Content-Transfer-Encoding' => 'Quoted-printable', 'Content-Disposition' => 'inline'


  # --- PASSWORD RESET --------------------------------------------------------

  # Send thank you email upon signup (before public launch)
  # def password_reset_instructions(user)
  #   load_default_opts
  # 
  #   @user, @password_reset_url = user, edit_password_reset_url(user.id, user.perishable_token)
  #   to = 'dev@xolator.com' unless prod? # PROTECT WHEN TESTING!
  #   to ||= user.email
  # 
  #   mail(:to => to, :subject => _i18n('subject')) do |format|
  #     format.text
  #   end
  # end

  # --- USER WELCOME ----------------------------------------------------------

  # Send welcome email upon signup (after public launch)
  def user_welcome(user)
    load_default_opts

    @user = user
    to = 'dev@xolator.com' if prod? # PROTECT WHEN TESTING!
    to ||= user.email

    mail(:to => to, :subject => 'Thank You!') do |format|
      format.text
    end
  end



# --- FUNCTIONS ---------------------------------------------------------------

protected

  def support_email; 'boyawards@interiordesign.net'; end

  def prod?; ['production'].include?(Rails.env); end

  def load_default_opts
    #
  end

end
