"
Obstaculo es una clase abstracta que representa los elementos del escenario que el Dino debe evitar. Reúne lo común a los obstáculos terrestres y aéreos: saber si ya fue contabilizado, para que otorgue puntos una sola vez, y si quedó detrás del Dino. Las subclases definen ancho, alto y alturaSobreElSuelo.
"
Class {
	#name : 'Obstaculo',
	#superclass : 'ElementoDelEscenario',
	#instVars : [
		'contabilizado'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'testing' }
Obstaculo class >> isAbstract [
	^ self == Obstaculo
]

{ #category : 'consultas' }
Obstaculo >> alturaSobreElSuelo [
	^ self subclassResponsibility
]

{ #category : 'consultas' }
Obstaculo >> estarDetrasDe: unDino [
	^ self area right < unDino area left
]

{ #category : 'initialization' }
Obstaculo >> initialize [
	super initialize.
	contabilizado := false
]

{ #category : 'acciones' }
Obstaculo >> marcarContabilizado [
	contabilizado := true
]

{ #category : 'consultas' }
Obstaculo >> puedeContabilizarse [
	^ contabilizado not
]
