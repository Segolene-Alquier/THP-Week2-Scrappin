require "rubygems"
require "open-uri"
require "nokogiri"

def get_price
array = []
db = Hash.new
i = 0
j = 0

doc = Nokogiri::HTML(open('https://coinmarketcap.com/'))

doc.css('a.currency-name-container').each do |name| #pour choper les noms de cryptos
	File.open('crypto_db_names.txt', 'a') { |file|
	file.puts(name.text) #feedback de ce que le programme est entrain d'importer
	}
end

File.readlines('crypto_db_names.txt').each do |line| #les noms de cryptos qui sont dans le fichier texte
        array[i] = line[0..-2] #enregistrer le nom(sans le '\n') dans un tableau
        i = i + 1
end

doc.css('a.price').each do |usd|
	File.open('crypto_db_usd.txt', 'a') { |file|
	file.puts("$" + usd['data-usd'])
	}
  end

File.readlines('crypto_db_usd.txt').each do |line| #pour chaque ligne du fichier texte avec les prix de crypto
  db[(array[j]).to_sym] = line[0..-2] #on associe des keys(nomdelacrypto) avec leurs valeurs(priceusd)
    j = j + 1
  end

return db

end

puts get_price
