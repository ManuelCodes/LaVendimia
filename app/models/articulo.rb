class Articulo < ApplicationRecord
	validates_presence_of :descripcion, :message => "No se puede continuar la descripción es requerida"
	validates_presence_of :modelo, :message => "No se puede continuar el modelo es requerido"
	validates_presence_of :precio, :message => "No se puede continuar el precio es requerido"
	validates_presence_of :existencia, :message => "No se puede continuar la existencia es requerida"
	validates_numericality_of :precio, on: :create, :greater_than => 0.99, :message => "El precio tiene que ser mayor o igual a uno"
	validates_numericality_of :precio, on: :update, :greater_than => 0.99, :message => "El precio tiene que ser mayor o igual a uno"
	has_many :RelVentaArticulo
	attr_accessor :prc_enganche
	attr_accessor :enganche
end
