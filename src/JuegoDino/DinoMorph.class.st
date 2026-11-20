"
clase grafica de Dino
"
Class {
	#name : 'DinoMorph',
	#superclass : 'Morph',
	#instVars : [
		'dino'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'updating' }
DinoMorph >> actualizar [ 
|origen|
dino ifNil: [ ^ self ].
origen := owner ifNil: [ 0 @ 0 ] ifNotNil: [ :juego | juego topLeft ].
self bounds: (dino area translateBy: origen)
]

{ #category : 'drawing' }
DinoMorph >> drawOn: aCanvas [
aCanvas fillRectangle: self bounds color: self color 
]

{ #category : 'initialization' }
DinoMorph >> initialize [
super initialize. 
self color: Color darkGray
]

{ #category : 'accessing' }
DinoMorph >> sobre: unDino [
dino := unDino.
self actualizar 
]
