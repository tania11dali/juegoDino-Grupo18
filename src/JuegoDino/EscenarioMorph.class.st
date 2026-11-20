"
EscenarioMorph es una subclase de Morph representa graficamente el escenario del juego.

Utiliza el atributo escenario para obtener las monedas y los obstaculos, y un diccionario para almacenar sus colores.

Dibuja el fondo, suelo, sol,  nubes, las monedas y los obstaculos utilizando figuras geometricas simples.

El metodo drawOn: organiza el dibujo mediante metodos auxiliares.

Esta clase se encarga solamente de la parte grafica, sin modificar la logica del juego.
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
EscenarioMorph >> dibujarAereo: unObstaculo en: aCanvas [
    | areaAereo |

    areaAereo := unObstaculo area translateBy: self topLeft.

    aCanvas
        fillOval: areaAereo
        color: (self colorPara: unObstaculo).

    aCanvas
        fillOval: ((areaAereo origin + (30 @ 10)) extent: 6 @ 6)
        color: Color white
]

{ #category : 'drawing' }
EscenarioMorph >> dibujarBordeEn: aCanvas [
aCanvas
frameRectangle: self bounds
width: self grosorDelBorde
color: self colorDelBorde
]

{ #category : 'drawing' }
EscenarioMorph >> dibujarCactus: unObstaculo en: aCanvas [
    | origen colorCactus |

    origen := (unObstaculo area translateBy: self topLeft) origin.
    colorCactus := self colorPara: unObstaculo.

    aCanvas
        fillRectangle: ((origen + (9 @ 0)) extent: 9 @ 50)
        color: colorCactus.

    aCanvas
        fillRectangle: ((origen + (0 @ 18)) extent: 25 @ 9)
        color: colorCactus.

    aCanvas
        fillRectangle: ((origen + (0 @ 6)) extent: 6 @ 18)
        color: colorCactus
]

{ #category : 'drawing' }
EscenarioMorph >> dibujarNubesEn: aCanvas [
    | origen |

    origen := self topLeft.

    aCanvas
        fillOval: ((origen + (82 @ 60)) extent: 116 @ 34)
        color: Color white.

    aCanvas
        fillOval: ((origen + (332 @ 60)) extent: 116 @ 34)
        color: Color white
]

{ #category : 'drawing' }
EscenarioMorph >> dibujarSolEn: aCanvas [
    | origen |

    origen := self topLeft.

    aCanvas
        fillOval: ((origen + (642 @ 32)) extent: 76 @ 76)
        color: (Color fromHexString: 'F7B32B')
]

{ #category : 'drawing' }
EscenarioMorph >> dibujarSueloEn: aCanvas [
    | origen alturaSuelo |

    origen := self topLeft.
    alturaSuelo := Dino sueloY.

    aCanvas
        fillRectangle: (
            (origen x @ (origen y + alturaSuelo))
                extent: self width @ (self height - alturaSuelo))
        color: self colorDelSuelo
]

{ #category : 'drawing' }
EscenarioMorph >> drawOn: aCanvas [
    | origen |

    aCanvas fillRectangle: self bounds color: self color.
    escenario ifNil: [ ^ self ].

    origen := self topLeft.

    self dibujarSolEn: aCanvas.
    self dibujarNubesEn: aCanvas.
    self dibujarSueloEn: aCanvas.

    escenario obstaculos do: [ :obstaculo |
        obstaculo class = ObstaculoAereo
            ifTrue: [
                self dibujarAereo: obstaculo en: aCanvas ]
            ifFalse: [
                self dibujarCactus: obstaculo en: aCanvas ] ].

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
        at: ObstaculoTerrestre
            put: (Color fromHexString: '08A045');
        at: ObstaculoAereo
            put: (Color fromHexString: '2E2E2E');
        at: Moneda
            put: (Color fromHexString: 'F7B32B')
]

{ #category : 'accessing' }
EscenarioMorph >> sobre: unEscenario [
escenario := unEscenario. 
^self
]
