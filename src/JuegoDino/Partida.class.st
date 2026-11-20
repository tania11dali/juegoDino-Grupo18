"
Representa una partida del juego Dino. Coordina el comportamiento del personaje y del escenario, administra el puntaje y la dificultad, recibe las acciones del jugador y controla el estado de la partida desde su inicio hasta su finalización.
"
Class {
	#name : 'Partida',
	#superclass : 'Object',
	#instVars : [
		'puntaje',
		'estado',
		'dino',
		'escenario',
		'proximoUmbralDificultad',
		'obstaculosSuperados'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'actualizacion' }
Partida >> actualizar [
    self estaEnCurso ifTrue: [
        dino actualizar.
        escenario avanzar.
        self procesarColision.
        self estaFinalizada ifFalse: [
            self registrarSuperados: (escenario recolectarEsquivadosPor: dino).
            self sumarPuntos:
                (escenario recolectarMonedasPor: dino) * self puntosPorMoneda.
        ].
    ].
]

{ #category : 'control de partida' }
Partida >> agachar [
    dino agachar.
]

{ #category : 'dificultad' }
Partida >> aumentarDificultad [
    escenario aumentarDificultad.
]

{ #category : 'acceso' }
Partida >> dino [
    ^ dino
]

{ #category : 'acceso' }
Partida >> escenario [
    ^ escenario
]

{ #category : 'control de partida' }
Partida >> estaEnCurso [
    ^ estado = #enCurso
]

{ #category : 'control de partida' }
Partida >> estaFinalizada [
    ^ estado = #finalizada
]

{ #category : 'acceso' }
Partida >> estado [
    ^ estado
]

{ #category : 'control de partida' }
Partida >> finalizarPartida [
    estado := #finalizada.
]

{ #category : 'control de partida' }
Partida >> iniciarPartida [
    estado := #enCurso.
]

{ #category : 'initialization' }
Partida >> initialize [
    super initialize.
    puntaje := 0.
    estado := #preparada.
    proximoUmbralDificultad := self obstaculosPorNivel.
    obstaculosSuperados := 0.
    dino := Dino new.
    escenario := Escenario new.
]

{ #category : 'control de partida' }
Partida >> levantarse [
    dino levantarse.
]

{ #category : 'dificultad' }
Partida >> obstaculosPorNivel [
    ^ 5
]

{ #category : 'acceso' }
Partida >> obstaculosSuperados [
    ^ obstaculosSuperados
]

{ #category : 'actualizacion' }
Partida >> procesarColision [
    (escenario obstaculoQueGolpeaA: dino)
        ifNotNil: [
            self finalizarPartida
        ].
]

{ #category : 'acceso' }
Partida >> proximoUmbralDificultad [
    ^ proximoUmbralDificultad
]

{ #category : 'acceso' }
Partida >> puntaje [
    ^ puntaje
]

{ #category : 'acceso' }
Partida >> puntosPorMoneda [
    ^ 5
]

{ #category : 'dificultad' }
Partida >> registrarSuperados: unaCantidad [
    obstaculosSuperados := obstaculosSuperados + unaCantidad.
    self sumarPuntos: unaCantidad.

    [obstaculosSuperados >= proximoUmbralDificultad]
        whileTrue: [
            self aumentarDificultad.
            proximoUmbralDificultad := proximoUmbralDificultad + self obstaculosPorNivel
        ].
]

{ #category : 'control de partida' }
Partida >> saltar [
    dino saltar.
]

{ #category : 'puntaje' }
Partida >> sumarPuntos: unaCantidad [
    puntaje := puntaje + unaCantidad.
]
