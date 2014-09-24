desc "Grab opportunities for American Airlines"
task :fetch_info => :environment do
  require 'nokogiri'
  require 'open-uri'

  base = "http://careers.aa.com"
  airline = Airline.friendly.find("american-airlines")

  doc_url = URI.join(base, "/en/ac/careers?jobloc=&jobfield=pilot&keywords=").to_s
  doc = Nokogiri::HTML(open(doc_url))
  opp_url = URI.join(base, doc.at_css(".job-title a")[:href]).to_s

  opp = Nokogiri::HTML(open(opp_url))

  opportunity = opp.at_css("#print p").text

  location = opp.at_css(".meta-a:nth-child(4)").text
  name = "#{opp.at_css(".job-header").text} in #{location}"
  program_type = "n/a"
  
  d = opp.at_css(".date-time").text.split(" ").first.split("/").collect{|s| s.to_i}
  duration = "Until #{opp.at_css(".date-time").text}"
	duration = "Until filled" if d[2] == 2099
  post_grad = "n/a"
  website = [opp_url, opp_url]
  hiring_status = "Active"
  rating = 10.0
  pd = opp.at_css(".meta-a:nth-child(6)").text.split(" ").first.split("/").collect{|s| s.to_i}
  posting_date = Time.new(pd[2], pd[0], pd[1])
  expiration_date = duration

  fly = Fly.create(airline: airline, name: name, program_type: program_type, duration: duration, post_graduation: post_grad,
  	website: website, hiring_status: hiring_status, rating: rating, location: location,
  	posting_date: posting_date, expiration_date: expiration_date)
end