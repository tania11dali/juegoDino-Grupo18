"
clase aplicacion dino es la encargada de crear juegomorph y la partida, guarda el mejor puntaje y permite que se pueda jugar una partia tras otra


"
Class {
	#name : 'AplicacionDino',
	#superclass : 'Object',
	#instVars : [
		'mejorPuntaje',
		'juego'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'running' }
AplicacionDino >> comenzarPartida [
juego ifNotNil: [ :anterior | anterior delete ].
juego := JuegoMorph new.
juego partida: Partida new.
juego mejorPuntaje: mejorPuntaje.
juego alTerminar: [ :partida | self terminarPartida: partida ].
juego alReiniciar: [ self comenzarPartida ].
juego abrir
]

{ #category : 'running' }
AplicacionDino >> iniciar [
self comenzarPartida
]

{ #category : 'initialization' }
AplicacionDino >> initialize [
super initialize.
mejorPuntaje := 0
]

{ #category : 'accessing' }
AplicacionDino >> mejorPuntaje [
^ mejorPuntaje
]

{ #category : 'running' }
AplicacionDino >> terminarPartida: unaPartida [
unaPartida puntaje > mejorPuntaje
	ifTrue: [ mejorPuntaje := unaPartida puntaje ].
	juego mejorPuntaje: mejorPuntaje
]
