desc "Send email"
task :send_email => :environment do
  Cohort.where(:email => "tyler@wargoats.com").each do |notif|
    CohortMailer.signup_email(notif).deliver
  end
end
