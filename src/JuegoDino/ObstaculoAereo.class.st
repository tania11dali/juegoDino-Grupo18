"
Obstaculo que aparece elevado. Colisiona con el Dino erguido, pero permite pasar por debajo cuando esta agachado.
"
Class {
	#name : 'ObstaculoAereo',
	#superclass : 'Obstaculo',
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'dimensiones' }
ObstaculoAereo >> alto [
	^ 40
]

{ #category : 'consultas' }
ObstaculoAereo >> alturaSobreElSuelo [
	^ 40
]

{ #category : 'dimensiones' }
ObstaculoAereo >> ancho [
	^ 45
]
