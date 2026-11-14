"
clase del EstadoDino
"
Class {
	#name : 'EstadoDino',
	#superclass : 'Object',
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'actions' }
EstadoDino >> actualizar: unDino [
^self subclassResponsibility 
]

{ #category : 'actions' }
EstadoDino >> agachar: unDino [
^self subclassResponsibility 
]

{ #category : 'actions' }
EstadoDino >> levantarse: unDino [
^self subclassResponsibility 
]

{ #category : 'actions' }
EstadoDino >> saltar: unDino [
^self subclassResponsibility 
]
