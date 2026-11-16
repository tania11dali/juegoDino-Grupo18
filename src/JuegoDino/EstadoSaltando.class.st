"
clase de estado del dino
"
Class {
	#name : 'EstadoSaltando',
	#superclass : 'EstadoDino',
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'actions' }
EstadoSaltando >> actualizar: unDino [
unDino aplicarGravedad.
unDino estaEnElSuelo ifTrue: [
	unDino aterrizar.
	unDino cambiarEstadoA: EstadoCorriendo new. ]
]

{ #category : 'actions' }
EstadoSaltando >> agachar: unDino [
"esta saltando, no puede agacharse"
]

{ #category : 'actions' }
EstadoSaltando >> alturaDelArea: unDino [
 ^ unDino class alturaNormal 
]

{ #category : 'actions' }
EstadoSaltando >> levantarse: unDino [
"no se utiliza en el salto"
]

{ #category : 'actions' }
EstadoSaltando >> saltar: unDino [
"ya salta"
]
