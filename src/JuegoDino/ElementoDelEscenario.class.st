"
clase de elementodelescenario
"
Class {
	#name : 'ElementoDelEscenario',
	#superclass : 'Object',
	#instVars : [
		'posicion'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'as yet unclassified' }
ElementoDelEscenario >> alto [
    self subclassResponsibility
]

{ #category : 'as yet unclassified' }
ElementoDelEscenario >> ancho [
    self subclassResponsibility
]

{ #category : 'accessing' }
ElementoDelEscenario >> area [
    ^ Rectangle
        origin: posicion
        extent: (self ancho @ self alto)

]

{ #category : 'moving' }
ElementoDelEscenario >> avanzar: unaDistancia [
    posicion := posicion - (unaDistancia @ 0)

]

{ #category : 'testing' }
ElementoDelEscenario >> estaFueraDePantalla [
    ^ self area right < 0

]

{ #category : 'accessing' }
ElementoDelEscenario >> posicion [
    ^ posicion
]

{ #category : 'accessing' }
ElementoDelEscenario >> posicionarEn: unaPosicion [
    posicion := unaPosicion

]
