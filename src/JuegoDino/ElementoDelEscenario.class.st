"
ElementoDelEscenario es una clase abstracta que representa los elementos que forman parte del escenario del juego.

Almacena la posicion de cada elemento y define el comportamiento comun de sus subclases.

Permite reutilizar codigo mediante la herencia y tratar los distintos elementos del escenario de manera uniforme mediante el polimorfismo.

Sus subclases representan las monedas y los obstaculos del juego.
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
