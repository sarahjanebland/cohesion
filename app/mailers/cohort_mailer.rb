class CohortMailer < ActionMailer::Base
  default from: 'hankjohnson2000@gmail.com'

  def signup_email(cohort)
  	link = cohort.secret_url
  	@url 	=	"http://bootconnect.com/access/#{link}"
  	@cohort = cohort
  	mail(to: cohort.email, subject: "Welcome to BootConnect!")
  end
end