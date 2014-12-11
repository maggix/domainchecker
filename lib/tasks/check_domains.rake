namespace :check_domains do

  require 'net/https'
  require 'date'

  desc 'Check Domains for SSL Certificates expiration'
  task :daily_check => :environment do
    @domains = Domain.all

    @domains.each do |domain|

      uri = URI.parse(domain.host)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.start do |h|
        @cert = h.peer_cert
      end
      if !@cert.nil?
        domain.expiration_date = @cert.not_after
        domain.save

        if @cert.not_after.to_date < Date.today then
          #send alert
          UserMailer.deliver_alert_email(domain)
          puts "Expired!"
        elsif @cert.not_after.to_date < Date.today - 14
          # Send notification
          UserMailer.deliver_notification_email(domain)
        else
          #Nothing to do
        end

      end
    end
  end

end