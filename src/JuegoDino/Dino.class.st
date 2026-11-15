"
clase Dino
"
Class {
	#name : 'Dino',
	#superclass : 'Object',
	#instVars : [
		'estado',
		'posicion',
		'velocidadVertical'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'constants' }
Dino class >> alturaAgachado [
^25
]

{ #category : 'constants' }
Dino class >> alturaNormal [
^50
]

{ #category : 'constants' }
Dino class >> ancho [
^40
]

{ #category : 'constants' }
Dino class >> gravedad [ 
^1
]

{ #category : 'constants' }
Dino class >> impulsoinicial [
^15
]

{ #category : 'constants' }
Dino class >> sueloY [ 
^300
]

{ #category : 'actions' }
Dino >> actualizar [ 
estado actualizar: self
]

{ #category : 'actions' }
Dino >> agachar [
estado agachar: self

]

{ #category : 'physics' }
Dino >> aplicarGravedad [
velocidadVertical := velocidadVertical + self class gravedad.
posicion := posicion x @ (posicion y + velocidadVertical)
]

{ #category : 'accessing' }
Dino >> area [
|alto|
alto := estado alturaDelArea: self.
^Rectangle 
origin: posicion x @(posicion y - alto)
extent: self class ancho @ alto 
]

{ #category : 'physics' }
Dino >> aterrizar [ 
posicion := posicion x @ self class sueloY.
velocidadVertical := 0 
]

{ #category : 'physics' }
Dino >> cambiarEstadoA: unEstado [
estado  := unEstado
]

{ #category : 'testing' }
Dino >> estaEnElSuelo [ 
^posicion y >= self class sueloY 
]

{ #category : 'physics' }
Dino >> impulsarSalto [
velocidadVertical := self class impulsoinicial negated
]

{ #category : 'initialization' }
Dino >> initialize [ 
super initialize.
estado := EstadoCorriendo new.
posicion := 50 @self class sueloY.
velocidadVertical := 0
]

{ #category : 'actions' }
Dino >> levantarse [
estado levantarse: self
]

{ #category : 'accessing' }
Dino >> posicion [
^posicion
]

{ #category : 'actions' }
Dino >> saltar [
estado saltar: self
]
