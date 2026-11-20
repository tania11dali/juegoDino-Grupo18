"
Reune los parametros de dificultad que varian durante la partida: la velocidad y la distancia entre obstaculos. Se incrementan mediante aumentar, dentro de los limites definidos en los metodos de clase.
"
Class {
	#name : 'Dificultad',
	#superclass : 'Object',
	#instVars : [
		'velocidad',
		'distanciaEntreObstaculos'
	],
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'configuracion' }
Dificultad class >> distanciaInicial [
	^ 400
]

{ #category : 'configuracion' }
Dificultad class >> distanciaMinima [
	^ 250
]

{ #category : 'configuracion' }
Dificultad class >> incrementoDeVelocidad [
	^ 1
]

{ #category : 'configuracion' }
Dificultad class >> reduccionDeDistancia [
	^ 20
]

{ #category : 'configuracion' }
Dificultad class >> velocidadInicial [
	^ 6
]

{ #category : 'configuracion' }
Dificultad class >> velocidadMaxima [
	^ 18
]

{ #category : 'dificultad' }
Dificultad >> aumentar [
	velocidad := (velocidad + self class incrementoDeVelocidad) min: self class velocidadMaxima.
	distanciaEntreObstaculos := (distanciaEntreObstaculos - self class reduccionDeDistancia) max: self class distanciaMinima
]

{ #category : 'accessing' }
Dificultad >> distanciaEntreObstaculos [
	^ distanciaEntreObstaculos
]

{ #category : 'initialization' }
Dificultad >> initialize [
	super initialize.
	velocidad := self class velocidadInicial.
	distanciaEntreObstaculos := self class distanciaInicial
]

{ #category : 'accessing' }
Dificultad >> velocidad [
	^ velocidad
]
