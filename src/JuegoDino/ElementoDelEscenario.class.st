"
ElementoDelEscenario es una clase abstracta que reúne lo común a los elementos que se desplazan por el escenario: una posición (esquina superior izquierda de su área), el avance hacia la izquierda, un área rectangular y la comprobación de salida de pantalla. Las subclases definen ancho y alto.
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

{ #category : 'dimensiones' }
ElementoDelEscenario >> alto [
    self subclassResponsibility
]

{ #category : 'dimensiones' }
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
