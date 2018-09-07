## Estacionamiento
#<<What happens when a frog parks in a no-parking space?>>

-El modulo debouncer.vhl es una maquina de estados que evita un falso contacto en las entradas, esperando a la estabilizacion de las mismas. <br/>
-El modulo Parking.vhl contiene la implementación de la maquina de estados de Moore para el sistema de estacionamiento.<br/>
-El modulo contador.vhl implementa un contador de 16 bits que aumenta o disminuye su registro en funcion de sus entradas Incr. y Decr.<br/>
-Los modulos Mux_hexa.vhl y Hexasseg.vhl se encargan de tomar la salida del contador y implementar su visualización en cuatro siete segmentos. <br/>
-El modulo Completito.vhl instancia los modulos previamente mencionados<br/>
