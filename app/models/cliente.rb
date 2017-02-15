class Cliente < ApplicationRecord
	validates_presence_of :nom_cliente, :ap_paterno, :ap_materno, :rfc
end
