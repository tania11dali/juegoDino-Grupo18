"
classe de estado del dino
"
Class {
	#name : 'EstadoAgachado',
	#superclass : 'EstadoDino',
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'actions' }
EstadoAgachado >> actualizar: unDino [
"no tiene movimiento vertical en el suelo"
]

{ #category : 'actions' }
EstadoAgachado >> agachar: unDino [
"esta agachado"
]

{ #category : 'actions' }
EstadoAgachado >> alturaDelArea: unDino [
^Dino alturaAgachado
]

{ #category : 'actions' }
EstadoAgachado >> levantarse: unDino [
unDino cambiarEstadoA: EstadoCorriendo new
]

{ #category : 'actions' }
EstadoAgachado >> saltar: unDino [
"esta agachado, debe levantarse"
]
