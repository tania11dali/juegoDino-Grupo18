"
Obstaculo que aparece a nivel del suelo, como un cactus. El Dino lo esquiva saltando.
"
Class {
	#name : 'ObstaculoTerrestre',
	#superclass : 'Obstaculo',
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'dimensiones' }
ObstaculoTerrestre >> alto [
	^ 50
]

{ #category : 'consultas' }
ObstaculoTerrestre >> alturaSobreElSuelo [
	^ 40
]

{ #category : 'dimensiones' }
ObstaculoTerrestre >> ancho [
	^ 25
]
