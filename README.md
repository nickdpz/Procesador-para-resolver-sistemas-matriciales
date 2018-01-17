# Procesador-para-resolver-sistemas-matriciales

Este proyecto consta de un procesador dedicado para resolver sistemas matriciales de 3x3.Se ingresan los datos por medio de tecla con comunicacion serial ya que esta el diseño de los driver. La visualizarcion de los resultados con dos decimales de exactitud, Se visualiza los resultados finales en los leds de una FPGA, con posibilidades de visualizacion en una LCD.

Los archivos 

Para realizar el procesamiento de los datos primero se guardan de forma estrategica en diferentes RAM para que sea mas facil implementar el algoritmo de cramer luego de tener los determinantes de cada matriz asociada se activara un bloque encargado de hacer la division para luego entregar los resultados. 