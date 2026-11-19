"
Moneda representa un elemento coleccionable del escenario.

Hereda de ElementoDelEscenario la posicion, el movimiento,
el calculo del area y la deteccion de salida de pantalla.

Define sus dimensiones mediante ancho y alto.
Escenario administra su recoleccion y Partida suma los puntos.
"
Class {
	#name : 'Moneda',
	#superclass : 'ElementoDelEscenario',
	#category : 'JuegoDino',
	#package : 'JuegoDino'
}

{ #category : 'dimensiones' }
Moneda >> alto [
    ^ 20
]

{ #category : 'dimensiones' }
Moneda >> ancho [
    ^ 20
]
