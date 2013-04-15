class CohortMailer < ActionMailer::Base
  default from: 'hankjohnson2000@gmail.com'

  def signup_email(cohort)
  	@url 	=	"http://boot-connect.herokuapp.com/access/#{cohort.secret_url}"
  	@name = cohort.name
  	mail(to: cohort.email, subject: "Welcome to BootConnect!")
  end
end
