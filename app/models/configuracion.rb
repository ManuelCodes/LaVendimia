class Configuracion < ApplicationRecord
	validates_presence_of :tasa, :message => "No se puede continuar la tasa es requerida"
	validates_presence_of :prc_enganche, :message => "No se puede continuar el porcentaje es requerido"
	validates_presence_of :plazo_maximo, :message => "No se puede continuar el plazo maximo es requerido"

	validates_inclusion_of :tasa, :in => 0..99, :message => "No se puede continuar la tasa está fuera de rango"
	validates_inclusion_of :prc_enganche, :in => 0..99, :message => "No se puede continuar el porcentaje está fuera de rango"
end
