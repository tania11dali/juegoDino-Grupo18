Class {
	#name : 'Escenario',
	#superclass : 'Object',
	#instVars : [
		'obstaculos',
		'generador',
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

{ #category : 'as yet unclassified' }
Escenario >> avanzar [
	| velocidad nuevoObstaculo nuevaMoneda |
	velocidad := dificultad velocidad.
	obstaculos do: [ :cadaUno | cadaUno avanzar: velocidad ].
	monedas do: [ :cadaUna | cadaUna avanzar: velocidad ].
	
	nuevoObstaculo := generador generarSiCorresponde: anchoVisible.
	nuevoObstaculo ifNotNil: [ obstaculos add: nuevoObstaculo ].
	
	nuevaMoneda := generadorDeMonedas generarSiCorresponde: anchoVisible.
	(nuevaMoneda notNil and: [ (self hayObstaculoSuperpuestoCon: nuevaMoneda) not ])
		ifTrue: [ monedas add: nuevaMoneda ].
		
	self retirarObstaculosFueraDePantalla.
	self retirarMonedasFueraDePantalla
]

{ #category : 'as yet unclassified' }
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
	generador := GeneradorDeObstaculos con: dificultad.
	generadorDeMonedas := GeneradorDeMonedas con: dificultad.
	anchoVisible := 800
]

{ #category : 'accessing' }
Escenario >> monedas [
	^ monedas asArray
]

{ #category : 'as yet unclassified' }
Escenario >> obstaculoQueGolpeaA: unDino [
	| areaDino |
	areaDino := unDino area.
	^ obstaculos
		detect: [ :cadaUno | cadaUno area intersects: areaDino ]
		ifNone: [ nil ]
]

{ #category : 'accessing' }
Escenario >> obstaculos [
	^ obstaculos asArray
]

{ #category : 'as yet unclassified' }
Escenario >> recolectarEsquivadosPor: unDino [
	| esquivados |
	esquivados := obstaculos select: [ :cadaUno |
		cadaUno puedeContabilizarse and: [ cadaUno estarDetrasDe: unDino ] ].
	esquivados do: [ :cadaUno | cadaUno marcarContabilizado ].
	^ esquivados size
]

{ #category : 'as yet unclassified' }
Escenario >> recolectarMonedasPor: unDino [
	| areaDino recolectadas |
	areaDino := unDino area.
	recolectadas := monedas select: [ :cadaUna | cadaUna area intersects: areaDino ].
	monedas removeAll: recolectadas.
	^ recolectadas size
]

{ #category : 'as yet unclassified' }
Escenario >> retirarMonedasFueraDePantalla [
	monedas removeAllSuchThat: [ :cadaUna | cadaUna estaFueraDePantalla ]
]

{ #category : 'as yet unclassified' }
Escenario >> retirarObstaculosFueraDePantalla [
	obstaculos removeAllSuchThat: [ :cadaUno | cadaUno estaFueraDePantalla ]
]
