# Timbre electrónico

module Talonario

  class Ted
    VERSION = "1.0"
    
    attr_accessor :rut_emisor, :tipo_dte, :folio_dte, :fecha_emision
    attr_accessor :rut_receptor, :razon_social_receptor, :monto_total
    attr_accessor :item_1_desc, :caf, :ted_timestamp
    
    def initialize(ted)
      true
    end
    
  end
  
end