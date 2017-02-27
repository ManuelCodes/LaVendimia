class Cliente < ApplicationRecord
	#validates_presence_of :nom_cliente, :ap_paterno, :ap_materno, :rfc
	validates_presence_of :nom_cliente, :message => "No se puede continuar el nombre es requerido"
	validates_presence_of :ap_paterno, :message => "No se puede continuar el apellido paterno es requerido"
	validates_presence_of :ap_materno, :message => "No se puede continuar el apellido materno es requerido"
	validates_presence_of :rfc, :message => "No se puede continuar el rfc es requerido"
	validates :rfc, :format => { with: /\A([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))((-)?([A-Z\d]{3}))?\z/, message: "No se puede continuar el formato del rfc es incorrecto"}
                 #:message => "your un dos tres tamarindo"
     #validates :rfc, :format => /^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))((-)?([A-Z\d]{3}))?$/,
      #           :message => "your un dos tres tamarindo", :multiline => true \A
end
