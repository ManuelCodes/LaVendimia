#json.label(@clientes, :nom_cliente)

#json.label @clientes do |cliente|
#  json.label cliente.nom_cliente
#end

#json.artists @artists do |artist|
#  json.id artist.id
#  json.name artist.name
#  json.label artist.label

#end

#json.label @clientes do |cliente|
#	cliente.nom_cliente
#end

#json.results( @clientes.map(&:nom_cliente).join(",") )