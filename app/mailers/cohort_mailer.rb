class CohortMailer < ActionMailer::Base
  default from: "admin@bootconnect.com"

  def signup_email(cohort)
  	link = cohort.secret_url
  	@url 	=	"http://bootconnect.com/#{link}"
  	mail(to: cohort.email, subject: "Welcome to BootConnect!")
  end
end