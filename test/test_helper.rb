require 'minitest/autorun'
require 'minitest/pride'
require 'turn'
require File.expand_path('../../lib/talonario.rb', __FILE__)


def invoice
  require 'ostruct'
  hash = {
    :id_doc => {:folio => 1, :fecha_emision => "2012-07-06"},
    :emisor => {:rut_emisor => "76530890-9", :razon_social_emisor => "IT Linux LTDA",
                :codigo_actividad => 200, :codigo_sii_sucursal => 1234,
                :direccion_emisor => "General Holley 2363", :comuna_emisor => "Prodivdencia",
                :giro_receptor => "Servicios Informaticos"
                },
    :receptor => {:rut_receptor => "13834853-9", :giro_receptor => "Personal",
                  :direccion_receptor => "Los Vientos 120", :comuna_receptor => "Til Til"
                  },
    :totales => {:monto_neto => 407213, :tasa_iva => 19, :iva => 77370, :monto_total => 484583 },
    :detalles => [
      {:numero_de_linea_detalle => 1,
       :nombre_del_detalle => "Licencias Zimbra",
       :descripcion_detalle => "500 licencias Standard para Gobierno",
       :cantidad_detalle => 1,
       :precio_unitario_detalle => 407213,
       :monto_detalle => 407213
       }
    ]
  }
  
end
