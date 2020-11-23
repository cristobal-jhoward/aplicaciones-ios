//: Playground - noun: a place where people can play

import UIKit

// Variables y constantes

var size : Float = 42.0

var answer = 42

let name : String = "Anakin"

/**/

// Todo es un objeto


// Propiedad de clase (propiedad estática)


Int.max


// Método de clase (método estático)
Double.minimum(12, 3)



/**/



/**/
// Las conversiones se hacen con inicializadores



let a = Int(size)
let ans = String(answer)

/**/

// typealias - Para dar otros nombres a un tipo

typealias Entero = Int

let a1 : Entero = 5



/**/

// Colecciones - Son tipadas

// String

/**/

// Arrays

/**/

// Los diccionarios no tienen orden

/**/

// Accedemos por la clave a los diccionarios

/**/

// Iterar

// Interpolación de valores en cadenas.
// Cualquier objeto se puede convertir en cadena ahí dentro si implementa un protocolo. Dicho protocolo tiene una propiedad que lo convierte en cadena
// Swift esta hecho de protocolos

/**/

// (key, value) Es una tupla

/**/

// Tupla - Tipo agregados (en ellos se asocian cosas diferentes).
// Es algo parecido a un objeto pero más trivial

/**/

// 1...5 es un Rango

/**/

// FUNCIONES

// Son tipos de 1ª clase como en JS.
// Se puede asignar funciones a variables
// Se pueden devolver como valor de retorno de otra función
// Se pueden pasar como parámetros de otra función

// Toda función captura el valor de las variables que estaban en el entorno léxico cuando ella fue creada

/**/

// Función sin nombre externo: la variable anónima _

/**/

// Imitamos los métodos de Cocoa que se autocomentan

/**/

// Parámetros con valores por defecto

/**/

// Las funciones que devuelven muchos valores realmente devuelven una tupla

/**/

// Funciones de alto nivel

/**/

// Funciones como parámetros. Aquí no tenemos que poner @escaping porque f se ejecuta dentro de apply

/**/


// Funciones como valores de retorno
// @escaping: las funcones f y h que pasamos como parámetro no se ejecutan dentro de compose

/**/


// Funciones de un mismo tipo, en un array

/**/


// CLOSURES (Representación literal de funciones)
// Capturan el valor de las variables que estaban en el entorno léxico cuando ella fue creada

/**/

// exactamente igual que ....

/**/

// Sintaxis simplificada de clausuras

/**/

// Los operadores son clausuras

/**/

// Podemos pasarle operadores en lugar de una clausura. * es una función

/**/

// Trailing clousure: Cuando la función es pasada como último parámetro

/**/

// Puedo hacer esto $ porque la función BinaryFunc dice que entran 2 Int y devuelve otro Int

/**/

// El tercer parámetro queda colgando

/**/

// OPCIONALES - empaqueto algo dentro de un opcional

/**/

// desempaquetado seguro por si hubiese un nil

/**/

// Desempaquetado peligroso

// var allaVoy : Int = maybeAnInt!

// opcional desempaquetado de forma explícita

/**/
// print(catacrac)

// Optiona Chaining

/**/

// Las funciones que aceptan tipos String pueden también aceptar tipos String?.
// ?. => Es un operador mágico.
// Dichas funciones solo devuelven algo si lo que hay en el opcional no es nil

/**/


// GUARD
// Impide que ningún parámetro indebido interfiera con una función.
// Acepta tanto expresiones booleanas como desempaquetados seguros, como if.

/**/

// UTILIZACIÓN DE GUARD, IF LET Y ?.

// GUARD -> Cuando compruebas parámetros de una función que es parcial, es decir, que tu función no funcionará con todos los valores posibles del tipo
// Ejemplo: Recibes un Int que solo tiene sentido para los positivos

// ?. -> Para tratar con opcionales en los que el tipo que tenga dentro disponga de muchos métodos que devuelven cosas. Sirve para encadenar procesos.

// IF LET -> Para todo lo demás. Es el que más se usa. Se suele usar al final de los procesos (En la Interface de Usuario)




// TIPOS AGREGADOS: enums, structs, classes, tuplas

// Si va a tener un delegado o va a enviar notificaciones, usa una Clase.
// Si representa algo que pasa por varios estados, usa una Enum
// Para todo lo demás, Struct.

// ENUMS
// Se usan cuando hay algo que tiene diferentes estados
// El tipo Optional es una enum con los valores (some, none)
// Podríamos darle valores a los estados pero por ahora lo dejamos así

// VALORES PARA LAS ENUMS:
// - ninguno (LightSabreColor)
// - Tipo homogéneo que se accede con la propiedad rawValue (Las veremos)
// - Tipos asociados, distintos en cada caso. Por ejemplo, Optional.

/**/

// STRUCTS
// Se gestionan de forma diferente que las clases.
// Se usan para cosas sencillas y en programación funcional

/**/

// CLASS
// REGLAS:
    // Si puedes dar valor por defecto, hazlo.Si no, cea un init
    // Usa opcionale solo cuando sea preciso
    // No uses ! a no ser que sepas lo que estas haciendo

/**/



//: ## Herencia
// No crea init designados en una subclase porque dejarás de heredar el init del padre
// Si se añaden propiedades deben tener valor o ser opcionales

/**/


// Exensiones
// Añadir código a clases preexistentes
// No se pueden añadir propiedades stored (de instancia)
// No se pueden añadir inits designados, sí de conveniencia

/**/


//: ## Gestión de errores
// Palabrejas: try, throw, throws, catch, do

// Toda función que pueda generar un error, está marcada con throw
// Toda función que lanza un error, se llama con try

/**/


//: ### Init fallable
// Para integrarse con los inits de cocoa que devuelven nill

// Aunque es mejor no utilizarlo. Consideraremos que un init no falla nunca
// Es mejor hacer validación en un paso previo y una vez que está todo bien
// hacer el inicializador con datos buenos

/**/


//: ### Casts en Swift
// Hay dos formas: A la fuerza y de forma segura

// Creo una subclase tonta de Thing

/**/



// iterarción

/**/

// For in: No tienes que gestionar los índices

/**/

// Map: abstrae todo, excepto lo que le haces al elemento

/**/

// Filter: filtra solo aquellos elementos que cumplen ciertos requisitos

/**/


//Reduce: aplica una operación a todos los elementos y me devuelve un elemento

/**/


// FlatMap: map + filter

/**/


//: ## Genéricos
// Ejemplos que ya conocemos: Las colecciones

let nums = [1,2,3,4,5]
let numss : Array<Int> = [1,2,3,4,5]

let dict : Dictionary<String, Int>?

let maybeADouble : Optional<Double>


// Class genérica

/**/


//: ## Niveles de Acceso
/*: Hay 4 opciones
 
 * public: se ve fuera del módulo. Util cuancdo haces Frameworks propias
 * internal: visible dentro del módulo (framework o app en la que estás trabajando). Es la opción por defeto y no hace falta escribirla
 * fileprivate: visible solo dentro del fichero
 * private: visible solo dentro del tipo
 */

/**/

//: # Value types & Reference types

//: structs & enums -> Value Types (no referencias) y se copian
//: class -> Reference type (no se copian y se comparten)
//: class requieren ARC
//: struct & enum no requieren ARC

// Copia de value types

/**/



// GCD Interface

// Se usa cuando vamos a realizar tareas que llevan un tiempo y no queremos que bloquee nuestra app (La interface de usuario). Por ejemplo, descargar archivos pesados de la internet, aplicar efectos a una foto, leer cosas del disco (sistema de ficheros, etc. Todas estas tareas conviene realizarlas en 2º plano.
// DispatchQueue es una clase que empaqueta una cola. Nosotros utilizaremos las colas de serie, no las crearemos desde 0. El SO nos da 4 colas así que es mejor aprovecharlas
// La cola main es donde se ejecuta la interface de usuario (todo lo de UIKit se debe ejecutar aquí)

/**/

// Esta es una cola de 2º plano. Le damos la prioridad mas baja (default: normal, userInitiated: unpoco mas alto, userInteractive: mas alto todavía, unspecified: un valor por defecto)

/**/

// Así le mandamos el método async que acepta una clausura, la mete en una cola y devuelve instantaneamente. Y esa clausura se ejecutará en algún momento del futuro próximo.

/**/

// COMO GCD NO ES LO IDEAL VERLO EN UN PLAYGROUND (las tareas en 2º plano no se ejecutan en los playgrounds). CREAREMOS UN PROYECTO PARA ELLO


