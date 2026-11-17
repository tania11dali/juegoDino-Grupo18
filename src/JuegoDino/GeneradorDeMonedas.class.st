"
GeneradorDeMonedas se encarga de decidir cuándo y dónde
crear nuevas monedas durante la partida.

Utiliza la dificultad del escenario para controlar la distancia
entre apariciones y Random para introducir variaciones.

Crea instancias de Moneda y las entrega a Escenario,
que administra su movimiento y recolección.
"
Class {
	#name : 'GeneradorDeMonedas',
	#superclass : 'Object',
	#instVars : [
		'dificultad',
		'distanciaPendiente',
		'azar'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'constants' }
GeneradorDeMonedas class >> alturaDeAparicion [
    ^ 220
]

{ #category : 'constants' }
GeneradorDeMonedas class >> distanciaEntreMonedas [
    ^ 300
]

{ #category : 'constants' }
GeneradorDeMonedas class >> variacionDeDistancia [
    ^ 100
]

{ #category : 'initialization' }
GeneradorDeMonedas >> con: unaDificultad [
    dificultad := unaDificultad.
    ^ self
]

{ #category : 'creation' }
GeneradorDeMonedas >> crearMonedaEn: unaPosicionX [
    | moneda |
    moneda := Moneda new.
    moneda posicionarEn: unaPosicionX @ self class alturaDeAparicion.
    ^ moneda

]

{ #category : 'generating' }
GeneradorDeMonedas >> generarSiCorresponde: unaPosicionX [
    distanciaPendiente := distanciaPendiente - dificultad velocidad.
    distanciaPendiente > 0 ifTrue: [ ^ nil ].
    self reiniciarDistancia.
    ^ self crearMonedaEn: unaPosicionX

]

{ #category : 'initialization' }
GeneradorDeMonedas >> initialize [
    super initialize.
    azar := Random new.
    distanciaPendiente := self class distanciaEntreMonedas

]

{ #category : 'initialization' }
GeneradorDeMonedas >> reiniciarDistancia [
    distanciaPendiente := self class distanciaEntreMonedas
        + ((azar next * self class variacionDeDistancia) truncated + 1)

]
