"
GeneradorDeObstaculos se encarga de decidir cuándo y dónde
crear nuevos obstáculos durante la partida.

Utiliza la dificultad del escenario para controlar la velocidad
y la distancia entre apariciones. Emplea Random para introducir
variaciones en la separación y seleccionar el tipo de obstáculo.

Genera instancias de ObstaculoTerrestre y ObstaculoAereo,
con una probabilidad del 50 % para cada tipo.

Inicializa la distancia pendiente utilizando la distancia base
proporcionada por Dificultad y, después de cada generación,
incorpora una variación aleatoria adicional de 1 a 100 unidades.

Posiciona los obstáculos considerando sus dimensiones,
su altura sobre el suelo y la coordenada del suelo del Dino.

Entrega los obstáculos creados a Escenario, que administra
su movimiento, las colisiones y su eliminación de la pantalla.

Cuando no corresponde generar un obstáculo, devuelve nil.
"
Class {
	#name : 'GeneradorDeObstaculos',
	#superclass : 'Object',
	#instVars : [
		'dificultad',
		'distanciaPendiente',
		'azar',
		'repeticiones',
		'ultimaClase'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'initialization' }
GeneradorDeObstaculos class >> con: unaDificultad [
    ^ self new con: unaDificultad
]

{ #category : 'constants' }
GeneradorDeObstaculos class >> maximoSeguidos [ 
^ 2
]

{ #category : 'constants' }
GeneradorDeObstaculos class >> probabilidadTerrestre [
    ^ 0.5
]

{ #category : 'constants' }
GeneradorDeObstaculos class >> variacionDeDistancia [
    ^ 100
]

{ #category : 'initialization' }
GeneradorDeObstaculos >> con: unaDificultad [
    dificultad := unaDificultad.
    distanciaPendiente := dificultad distanciaEntreObstaculos.
    ^ self
]

{ #category : 'creation' }
GeneradorDeObstaculos >> crearObstaculoEn: unaPosicionX [
    | obstaculo |
    obstaculo := self elegirObstaculo.
    obstaculo posicionarEn: unaPosicionX @
        (Dino sueloY - obstaculo alturaSobreElSuelo - obstaculo alto).
    ^ obstaculo
]

{ #category : 'creation' }
GeneradorDeObstaculos >> elegirObstaculo [
	| clase |
	clase := azar next < self class probabilidadTerrestre
		ifTrue: [ ObstaculoTerrestre ]
		ifFalse: [ ObstaculoAereo ].
	(clase == ultimaClase and: [ repeticiones >= self class maximoSeguidos ])
		ifTrue: [
			clase := clase == ObstaculoTerrestre
				ifTrue: [ ObstaculoAereo ]
				ifFalse: [ ObstaculoTerrestre ] ].
	repeticiones := clase == ultimaClase ifTrue: [ repeticiones + 1 ] ifFalse: [ 1 ].
	ultimaClase := clase.
	^ clase new
]

{ #category : 'generating' }
GeneradorDeObstaculos >> generarSiCorresponde: unaPosicionX [
    distanciaPendiente := distanciaPendiente - dificultad velocidad.
    distanciaPendiente > 0 ifTrue: [ ^ nil ].
    self reiniciarDistancia.
    ^ self crearObstaculoEn: unaPosicionX
]

{ #category : 'initialization' }
GeneradorDeObstaculos >> initialize [
    super initialize.
    azar := Random new.
    distanciaPendiente := 0.
	 repeticiones := 0 
]

{ #category : 'initialization' }
GeneradorDeObstaculos >> reiniciarDistancia [
    distanciaPendiente := dificultad distanciaEntreObstaculos
        + ((azar next * self class variacionDeDistancia) truncated + 1)
]
