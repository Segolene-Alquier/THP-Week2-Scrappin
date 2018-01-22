require "rubygems"
require "open-uri"
require "nokogiri"

def get_all_the_emails_of_val_doise_townhalls
  url = []
  db = Hash.new
  doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  hrefs = doc.css('a.lientxt').map { |link| link['href'] }
  hrefs.each do |item|
    url = "http://annuaire-des-mairies.com/" + item[2..-1]

  doc2 = Nokogiri::HTML(open(url))
    doc2.css('tr/td/p/font').each do |node|
      if /@/ =~ node.text
         node.text
        db[(url)[35..-6]] = node.text[2..-1]
      end
    end
  end
  return db
end




puts get_all_the_emails_of_val_doise_townhalls
