"
clase de estado del dino
"
Class {
	#name : 'EstadoCorriendo',
	#superclass : 'EstadoDino',
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'actions' }
EstadoCorriendo >> actualizar: unDino [
"no hay movimiento vertical en el suelo"
]

{ #category : 'actions' }
EstadoCorriendo >> agachar: unDino [
unDino cambiarEstadoA: EstadoAgachado new. 
]

{ #category : 'actions' }
EstadoCorriendo >> alturaDelArea: unDino [
^Dino alturaNormal 
]

{ #category : 'actions' }
EstadoCorriendo >> levantarse: unDino [
"--"
]

{ #category : 'actions' }
EstadoCorriendo >> saltar: unDino [
unDino impulsarSalto.
unDino cambiarEstadoA: EstadoSaltando new. 

]
