require "rubygems"
require "open-uri"
require "nokogiri"

def get_all_the_emails_of_val_doise_townhalls
  doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  hrefs = doc.css('a.lientxt').map { |link| link['href'] }
    puts hrefs
  hrefs.each do |item|
    url = "http://annuaire-des-mairies.com/" + item[2..-1]

  doc2 = Nokogiri::HTML(open(url))
    doc2.css('tr/td/p/font').each do |node|
      if /@/ =~ node.text
        puts node.text

      end
    end
  end
end
get_all_the_emails_of_val_doise_townhalls

=begin
def get_the_email_of_a_townhal_from_its_webpage
  doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))
  doc.css('tr/td/p/font').each do |node|
    if /@/ =~ node.text
      puts node.text
    end
  end
end
get_the_email_of_a_townhal_from_its_webpage


def get_all_the_urls_of_val_doise_townhalls
  doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  hrefs = doc.css('a.lientxt').map { |link| link['href'] }
    puts hrefs
end
get_all_the_urls_of_val_doise_townhalls

=end
