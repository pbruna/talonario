require_relative '../../test_helper'

describe Talonario::Factura do

  def setup
    @invoice_hash = invoice
  end


  describe "when creating a new invoice" do

    it "should not be nil" do
      factura = Talonario::Factura.new(@invoice_hash, "")
      factura.wont_be_nil
    end
    
    it "should have an id equals to '{AAAAMMDD}{FOLIO}T{TIPO_DTE}" do
      factura = Talonario::Factura.new(@invoice_hash, "")
      id = "201207061T33"
      factura.id.must_equal id
    end
  end
  
  describe "when converting to xml" do
    it "should return the Encabezado members" do
      factura = Talonario::Factura.new(@invoice_hash, "")
      encabezado = %w( IdDoc Emisor Receptor Totales )
      respuesta = Nokogiri::XML(factura.encabezado_xml).child.element_children.map {|c| c.name}
      encabezado.must_equal respuesta
    end
    
    it "should return Detalle members" do
      factura = Talonario::Factura.new(@invoice_hash, "")
      respuesta = Nokogiri::XML(factura.detalle_xml).child.element_children.map {|c| c.name}
      respuesta.must_be_kind_of Array
    end
    
  end


end
