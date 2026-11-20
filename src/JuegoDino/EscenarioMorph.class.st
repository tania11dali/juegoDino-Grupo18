"
clase morph del escenario
"
Class {
	#name : 'EscenarioMorph',
	#superclass : 'Morph',
	#instVars : [
		'escenario',
		'colores'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'styling' }
EscenarioMorph >> colorDeFondo [
^ Color fromHexString: 'BFD7B5'
"otra forma de asignar color: ^ Color brown"
"Ootra forma Color r: 0.53 g: 0.81 b: 0.92"
"fromHexString: 'BFD7B5'"
]

{ #category : 'styling' }
EscenarioMorph >> colorDelBorde [
^ Color fromHexString: '2E2E2E'
]

{ #category : 'styling' }
EscenarioMorph >> colorDelSuelo [
^ Color fromHexString: '0B6E4F'
]

{ #category : 'accessing' }
EscenarioMorph >> colorPara: unElemento [
^ colores at: unElemento class ifAbsent: [ Color gray ]
]

{ #category : 'drawing' }
EscenarioMorph >> dibujarBordeEn: aCanvas [
aCanvas
frameRectangle: self bounds
width: self grosorDelBorde
color: self colorDelBorde
]

{ #category : 'drawing' }
EscenarioMorph >> drawOn: aCanvas [
| origen |
aCanvas fillRectangle: self bounds color: self color.
escenario ifNil: [ ^ self ].
origen := self topLeft.
aCanvas
fillRectangle: ((origen x @ (origen y + Dino sueloY)) extent: self width @ 2)
color: self colorDelSuelo.
escenario obstaculos do: [ :obstaculo |
aCanvas
fillRectangle: (obstaculo area translateBy: origen)
color: (self colorPara: obstaculo) ].
escenario monedas do: [ :moneda |
aCanvas
fillOval: (moneda area translateBy: origen)
color: (self colorPara: moneda) ].
self dibujarBordeEn: aCanvas
]

{ #category : 'styling' }
EscenarioMorph >> grosorDelBorde [
^ 3
]

{ #category : 'initialization' }
EscenarioMorph >> initialize [
super initialize.
self color: self colorDeFondo.
self extent: 800 @ 350.
colores := Dictionary new.
colores
at: ObstaculoTerrestre put: Color green muchDarker;
at: ObstaculoAereo put: Color orange;
at: Moneda put: Color yellow 

"en esta estructura at: put: seria: at:Moneda put: (Color fromHexString: 'codigo de color'')"
]

{ #category : 'accessing' }
EscenarioMorph >> sobre: unEscenario [
escenario := unEscenario. 
^self
]
