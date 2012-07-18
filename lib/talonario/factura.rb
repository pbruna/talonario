# Todo entre <Documento></Documento>
# El objeto DTE se inicializa con un objeto INVOICE, el debe responder
# a los siguientes métodos y cada uno de ellos a los métodos que se indican
#
# - id_doc: folio, fecha_emision // tipo_dte
# - emisor: rut_emisor, razon_social_emisor, giro_emisor, codigo_actividad, codigo_sii_sucursal, direccion_emisor, comuna_emisor
# - receptor: rut_receptor, razon_social_receptor, giro_receptor, direccion_receptor, comuna_receptor
# - totales: monto_neto, tasa_iva, iva, monto_total
# - detalles[array]: numero_de_linea_detalle, nombre_del_detalle, descripcion_detalle, cantidad_detalle, unidad_referencia_detalle, precio_unitario_detalle, monto_detalle


module Talonario

  class Factura
    TIPO_DTE = 33
    TRANSLATION = {
      :folio => "Folio", :fecha_emision => "FchEmis", :tipo_dte => "TipoDTE",
      :rut_emisor => "RUTEmisor", :razon_social_emisor => "RznSoc", :giro_emisor => "GiroEmis",
      :codigo_actividad => "Acteco", :codigo_sii_sucursal => "CdgSIISucur", :direccion_emisor => "DirOrigen",
      :comuna_emisor => "CmnaOrigen", :rut_receptor => "RUTRecep", :razon_social_receptor => "RznSocRecep",
      :giro_receptor => "GiroRecep", :direccion_receptor => "DirRecep", :comuna_receptor => "CmnaRecep",
      :monto_neto => "MntNeto", :tasa_iva => "TasaIVA", :iva => "IVA", :monto_total => "MntTotal",
      :numero_de_linea_detalle => "NroLinDet", :nombre_del_detalle => "NmbItem",
      :descripcion_detalle => "DscItem", :cantidad_detalle => "QtyItem", :precio_unitario_detalle => "PrcItem",
      :monto_detalle => "MontoItem"
    }

    attr_accessor :id_doc, :emisor, :receptor, :totales, :detalles

    def initialize(invoice_hash, caf)
      @invoice = invoice_hash
      @ted = Talonario::Ted.new(self)
      @caf = caf
    end



    def id_doc
      @invoice[:id_doc][:tipo_dte] = TIPO_DTE
      @invoice[:id_doc]
    end

    def emisor
      @invoice[:emisor]
    end

    def receptor
      @invoice[:receptor]
    end

    def totales
      @invoice[:totales]
    end

    def detalles
      @invoice[:detalles]
    end

    def id
      "#{id_doc[:fecha_emision].gsub(/-/,'')}#{id_doc[:folio]}T#{TIPO_DTE}"
    end

    def to_xml
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.Documento(:ID => id)
      end
      document = Nokogiri::XML(builder.to_xml)
      document.root << Nokogiri::XML(encabezado_xml).root
      document.root << Nokogiri::XML(detalle_xml).root
    end

    def encabezado_xml
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.Encabezado {
          xml.IdDoc {
            xml.tipoDTE id_doc[:tipo_dte]
            xml.Folio id_doc[:folio]
            xml.FchEmis id_doc[:fecha_emision]
          }
          xml.Emisor {
            emisor.keys.each do |k|
              xml.send(TRANSLATION[k.to_sym], emisor[k.to_sym])
            end
          }
          xml.Receptor {
            receptor.keys.each do |k|
              xml.send(TRANSLATION[k.to_sym], receptor[k.to_sym])
            end
          }
          xml.Totales {
            totales.keys.each do |k|
              xml.send(TRANSLATION[k.to_sym], totales[k.to_sym])
            end
          }
        }
      end
      Nokogiri::XML(builder.to_xml).root.to_xml
    end
    
    def detalle_xml
      builder = Nokogiri::XML::Builder.new do |xml|
        detalles.each do |detalle|
          xml.Detalle {
            detalle.keys.each do |k|
              xml.send(TRANSLATION[k.to_sym], detalle[k.to_sym])
            end
          }
        end
      end
      Nokogiri::XML(builder.to_xml).root.to_xml
    end



  end

end
