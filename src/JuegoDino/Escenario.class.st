Class {
	#name : 'Escenario',
	#superclass : 'Object',
	#instVars : [
		'obstaculos',
		'generadorDeObstaculos',
		'dificultad',
		'anchoVisible',
		'monedas',
		'generadorDeMonedas'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'dificultad' }
Escenario >> aumentarDificultad [
	dificultad aumentar
]

{ #category : 'movimiento' }
Escenario >> avanzar [
	| velocidad nuevoObstaculo nuevaMoneda |
	velocidad := dificultad velocidad.
	obstaculos do: [ :cadaUno | cadaUno avanzar: velocidad ].
	monedas do: [ :cadaUna | cadaUna avanzar: velocidad ].
	
	nuevoObstaculo := generadorDeObstaculos generarSiCorresponde: anchoVisible.
	nuevoObstaculo ifNotNil: [ obstaculos add: nuevoObstaculo ].
	
	nuevaMoneda := generadorDeMonedas generarSiCorresponde: anchoVisible.
	(nuevaMoneda notNil and: [ (self hayObstaculoSuperpuestoCon: nuevaMoneda) not ])
		ifTrue: [ monedas add: nuevaMoneda ].
		
	self retirarObstaculosFueraDePantalla.
	self retirarMonedasFueraDePantalla
]

{ #category : 'colisiones' }
Escenario >> hayObstaculoSuperpuestoCon: unaMoneda [
	| areaMoneda |
	areaMoneda := unaMoneda area.
	^ obstaculos anySatisfy: [ :cadaUno | cadaUno area intersects: areaMoneda ]
]

{ #category : 'initialization' }
Escenario >> initialize [
	super initialize.
	obstaculos := OrderedCollection new.
	monedas := OrderedCollection new.
	dificultad := Dificultad new.
	generadorDeObstaculos := GeneradorDeObstaculos con: dificultad.
	generadorDeMonedas := GeneradorDeMonedas con: dificultad.
	anchoVisible := 800
]

{ #category : 'acceso' }
Escenario >> monedas [
	^ monedas asArray
]

{ #category : 'colisiones' }
Escenario >> obstaculoQueGolpeaA: unDino [
	| areaDino |
	areaDino := unDino area.
	^ obstaculos
		detect: [ :cadaUno | cadaUno area intersects: areaDino ]
		ifNone: [ nil ]
]

{ #category : 'acceso' }
Escenario >> obstaculos [
	^ obstaculos asArray
]

{ #category : 'recolección' }
Escenario >> recolectarEsquivadosPor: unDino [
	| esquivados |
	esquivados := obstaculos select: [ :cadaUno |
		cadaUno puedeContabilizarse and: [ cadaUno estarDetrasDe: unDino ] ].
	esquivados do: [ :cadaUno | cadaUno marcarContabilizado ].
	^ esquivados size
]

{ #category : 'recolección' }
Escenario >> recolectarMonedasPor: unDino [
	| areaDino recolectadas |
	areaDino := unDino area.
	recolectadas := monedas select: [ :cadaUna | cadaUna area intersects: areaDino ].
	monedas removeAll: recolectadas.
	^ recolectadas size
]

{ #category : 'private' }
Escenario >> retirarMonedasFueraDePantalla [
	monedas removeAllSuchThat: [ :cadaUna | cadaUna estaFueraDePantalla ]
]

{ #category : 'private' }
Escenario >> retirarObstaculosFueraDePantalla [
	obstaculos removeAllSuchThat: [ :cadaUno | cadaUno estaFueraDePantalla ]
]
