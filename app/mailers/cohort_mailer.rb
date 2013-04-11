class CohortMailer < ActionMailer::Base
  default from: "admin@bootconnect.com"

  def signup_email(cohort)
  	@cohort = cohort
  	@url 	=	"http://bootconnect.com/secret_url"
  	mail(to: @cohort.email/, subject: "Welcome to BootConnect!")
  end
end

/slash in line 7 to avoid accidentail mailings/
# CohortMailer.signup_email(cohort).deliver