require_relative '../../test_helper'

describe Talonario::Factura do

  def setup
    invoice_hash = invoice
    caf_file = File.open(load_caf_file)
    @factura = Talonario::Factura.new(invoice_hash, caf_file)
  end


  describe "when creating a new invoice" do

    it "should not be nil" do
      @factura.wont_be_nil
    end
    
    it "should have an id equals to '{AAAAMMDD}{FOLIO}T{TIPO_DTE}" do
      id = "201207061T33"
      @factura.id.must_equal id
    end
    
    it "should have a valid caf" do
      @factura.caf.must_be_instance_of Talonario::Caf
      @factura.caf.rut.size.must_equal 10
    end
    
  end
  
  describe "when converting to xml" do
    it "should return the Encabezado members" do
      encabezado = %w( IdDoc Emisor Receptor Totales )
      respuesta = Nokogiri::XML(@factura.encabezado_xml).child.element_children.map {|c| c.name}
      encabezado.must_equal respuesta
    end
    
    it "should return Detalle members" do
      respuesta = Nokogiri::XML(@factura.detalle_xml).child.element_children.map {|c| c.name}
      respuesta.must_be_kind_of Array
    end
    
  end


end
