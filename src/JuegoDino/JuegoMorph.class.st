"
clase de JuegoMorph, encargada de hacer colaboraciones entre clases, para concetar entorno graficos y clases del dominio. 
"
Class {
	#name : 'JuegoMorph',
	#superclass : 'Morph',
	#instVars : [
		'partida',
		'escenarioMorph',
		'dinoMorph',
		'etiquetaPuntaje',
		'etiquetaRecord',
		'etiquetaMensaje',
		'alTerminar',
		'alReiniciar',
		'finNotificado'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'opening' }
JuegoMorph >> abrir [
self openInWorld.
self world activeHand newKeyboardFocus: self
]

{ #category : 'private' }
JuegoMorph >> accionDeEspacio [
partida estado = #preparada ifTrue: [ ^ partida iniciarPartida ].
partida estaEnCurso ifTrue: [ ^ partida saltar ].
partida estaFinalizada ifTrue: [
alReiniciar ifNotNil: [ :accion | accion value ] ]
]

{ #category : 'private' }
JuegoMorph >> actualizarEtiquetas [
etiquetaPuntaje contents: 'Puntos: ', partida puntaje printString.
etiquetaMensaje contents: self textoDelMensaje.
etiquetaMensaje center: self center
]

{ #category : 'accessing' }
JuegoMorph >> alReiniciar: unBloque [
alReiniciar := unBloque
]

{ #category : 'accessing' }
JuegoMorph >> alTerminar: unBloque [
alTerminar := unBloque
]

{ #category : 'events' }
JuegoMorph >> handlesKeyboard: unEvento [
^ true
]

{ #category : 'events' }
JuegoMorph >> handlesMouseDown: unEvento [
^ true
]

{ #category : 'initialization' }
JuegoMorph >> initialize [
super initialize.
self extent: 800 @ 350.
self clipSubmorphs: true.
finNotificado := false.
escenarioMorph := EscenarioMorph new.
dinoMorph := DinoMorph new.
etiquetaPuntaje := StringMorph new contents: 'Puntos: 0'; color: Color black; yourself.
etiquetaRecord := StringMorph new contents: 'Record: 0'; color: Color black; yourself.
etiquetaMensaje := StringMorph new contents: ''; color: Color black; yourself.
self addMorph: escenarioMorph.
self addMorph: dinoMorph.
self addMorph: etiquetaPuntaje.
self addMorph: etiquetaRecord.
self addMorph: etiquetaMensaje.
escenarioMorph position: self position.
etiquetaPuntaje position: self topLeft + (10 @ 8).
etiquetaRecord position: self topLeft + (200 @ 8)
]

{ #category : 'events' }
JuegoMorph >> keyDown: unEvento [
unEvento key = KeyboardKey space ifTrue: [ ^ self accionDeEspacio ].
unEvento key = KeyboardKey down ifTrue: [ partida agachar ]
]

{ #category : 'events' }
JuegoMorph >> keyUp: unEvento [
unEvento key = KeyboardKey down ifTrue: [ partida levantarse ]
]

{ #category : 'accessing' }
JuegoMorph >> mejorPuntaje: unNumero [
etiquetaRecord contents: 'Record: ', unNumero printString
]

{ #category : 'events' }
JuegoMorph >> mouseDown: unEvento [
unEvento hand newKeyboardFocus: self
]

{ #category : 'accessing' }
JuegoMorph >> partida: unaPartida [
partida := unaPartida.
escenarioMorph sobre: partida escenario.
dinoMorph sobre: partida dino.
dinoMorph actualizar.
self actualizarEtiquetas
]

{ #category : 'stepping' }
JuegoMorph >> step [
partida actualizar.
dinoMorph actualizar.
escenarioMorph changed.
self actualizarEtiquetas.
(partida estaFinalizada and: [ finNotificado not ]) ifTrue: [
finNotificado := true.
alTerminar ifNotNil: [ :accion | accion value: partida ] ]
]

{ #category : 'stepping' }
JuegoMorph >> stepTime [
	^ 25
]

{ #category : 'private' }
JuegoMorph >> textoDelMensaje [
partida estado = #preparada ifTrue: [ ^ 'Presioná ESPACIO para jugar' ].
partida estaEnCurso ifTrue: [ ^ '' ].
^ 'GAME OVER - ESPACIO para reiniciar'
]
