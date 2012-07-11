module Talonario
  
  class Caf
    attr_accessor :autorizacion
    
    def initialize(caf_xml)
      @autorization = Nokogiri::XML(caf_xml)
    end
    
    def folio_start
      @autorization.xpath('//RNG/D').text.to_i
    end
    
    def folio_end
      @autorization.xpath('//RNG/H').text.to_i
    end
    
    def rut
      @autorization.xpath('//RE').text
    end
    
    def folio_qty
      folio_end - folio_start
    end
    
    def dte_type
      @autorization.xpath('//TD').text.to_i
    end
    
    def private_key
      @autorization.xpath('//RSASK').text
    end
    
    def public_key
      @autorization.xpath('//RSAPUBK').text
    end
    
    def datos
      @autorization.xpath('//DA').to_xml
    end
    
  end
  
  
end