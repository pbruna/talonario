require_relative '../../test_helper'
 
describe Talonario::Caf do
 
  def setup
    @caf = Talonario::Caf.new(caf_xml)
  end

  it "should be a number greater than 0" do
    @caf.folio_start.must_be :>, 0
  end
  
  it "should be greater than start_folio" do
    @caf.folio_end.must_be :>, @caf.folio_start
  end
  
  it "should be equal than end delta start" do
    @caf.folio_qty.must_equal (@caf.folio_end - @caf.folio_start)
  end
  
  it "should return the type of dte" do
    @caf.dte_type.must_be_kind_of Fixnum
  end
  
  it "should return the datos xml segment" do
    Nokogiri::XML(@caf.datos).wont_be_nil
  end
  
  
  def caf_xml
    '<?xml version="1.0"?>
    <AUTORIZACION>
    <CAF version="1.0">
    <DA>
    <RE>76530890-9</RE>
    <RS>TECNOLOGIAS DE INFORMACION LINUX LTDA</RS>
    <TD>33</TD>
    <RNG><D>1</D><H>50</H></RNG>
    <FA>2012-07-09</FA>
    <RSAPK><M>mn1WLZXRg6ImT5ezYtlr9TLjP8fCYafkezX/yqFMK0C9Zh0JU75YCZvkPvIOcLHN5eg/coDksy4SLXw9Gf9DHw==</M><E>Aw==</E></RSAPK>
    <IDK>100</IDK>
    </DA>
    <FRMA algoritmo="SHA1withRSA">Elr16DGBYlN6BFFBmU7PbXiCZ5PATUz3sQ2BaImyPy817jmGh+15P4CfkuuWaIBL7eyLcc+BpiP5CtqEoe7P0g==</FRMA>
    </CAF>
    <RSASK>-----BEGIN RSA PRIVATE KEY-----
    MIIBOQIBAAJBAJp9Vi2V0YOiJk+Xs2LZa/Uy4z/HwmGn5Hs1/8qhTCtAvWYdCVO+
    WAmb5D7yDnCxzeXoP3KA5LMuEi18PRn/Qx8CAQMCQGb+OXO5NlfBbt+6d5c7nU4h
    7NUv1uvFQvzOqocWMsd/dRdUCGREI7e8eM9z26D8nqKYl/ocvsKr3lWyCtpK4TsC
    IQDI97aqSGZJSpDBeEPQ4P5cPvoon1t7jQE1mH7ze4ZofQIhAMTLaFJ08dkrcG2P
    gHQeOIOzCTLb+ksCKw8UcjlXCIjLAiEAhfp5xtru24cLK6WCi0CpktSmxb+SUl4A
    zmWp96eu8FMCIQCDMkWMTfaQx6BJClWivtBXzLDMkqbcrBy0uEwmOgWwhwIgPRdR
    kSUi79iDtS5Gj6MtCxmxl4HelAWsLgBG9ZJPhRg=
    -----END RSA PRIVATE KEY-----
    </RSASK>
    
    <RSAPUBK>-----BEGIN PUBLIC KEY-----
    MFowDQYJKoZIhvcNAQEBBQADSQAwRgJBAJp9Vi2V0YOiJk+Xs2LZa/Uy4z/HwmGn
    5Hs1/8qhTCtAvWYdCVO+WAmb5D7yDnCxzeXoP3KA5LMuEi18PRn/Qx8CAQM=
    -----END PUBLIC KEY-----
    </RSAPUBK>
    </AUTORIZACION>'
  end
  
end