describe Talonario::Ted do

  def setup
    invoice_hash = invoice
    caf_file = load_caf_file
    @factura = Talonario::Factura.new(invoice_hash, caf_file)
    @ted = Talonario::Ted::new(@factura)
  end

  describe "when creating a new ted" do
    it "datos should be a hash" do
      @ted.datos.must_be_kind_of Hash
    end
  end
  
  describe "when converting to xml" do
    it "should have a first element with name TED" do
      @ted.to_xml.root.name.must_equal "TED"
    end
    
    it "should have this 2 child elements: DD, FRMT" do
      @ted.to_xml.root.element_children[0].name.must_equal "DD"
      @ted.to_xml.root.element_children[1].name.must_equal "FRMT"
    end
    
    it "should have a list of grand_children elements" do
      childrens = %w(RE TD F FE RR RSR MNT IT1 CAF TSTED)
      respuesta = @ted.to_xml.child.child.element_children.map {|c| c.name}
      childrens.must_equal respuesta
    end
  end
  
end