#nom incubateur
#code postal
#site internet

require "rubygems"
require "open-uri"
require "nokogiri"


Element.show('network_navigate_search');
new Ajax.Request('/site_incubateur/incubateurs_inside/1',
  {asynchronous:true, evalScripts:true, method:'get',
  onSuccess:function(request){Element.hide('network_navigate_search');},
  parameters:'text_search_filter=' +
  encodeURIComponent(document.getElementById('text_search_filter').value)
  + '&zip=' + '&page=2'});
  return false;
