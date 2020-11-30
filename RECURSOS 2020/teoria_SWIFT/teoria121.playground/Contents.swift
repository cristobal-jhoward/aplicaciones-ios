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


var swift = "Nuevo lengiaje de Apple"

swift = swift + "!"

/**/

// Arrays

var words : [String] = ["uno", "dos", "tres"]

words[0]

var rr = Array<String>()

var rrr : [String] = []

rr.append("hola")

rrr.append("adios")


/**/

// Los diccionarios no tienen orden


let numberNames : [Int : String] = [1: "one", 2: "two"]

// Accedemos por la clave a los diccionarios
numberNames[2]
/**/



/**/

// Iterar

// Interpolación de valores en cadenas.
// Cualquier objeto se puede convertir en cadena ahí dentro si implementa un protocolo. Dicho protocolo tiene una propiedad que lo convierte en cadena
// Swift esta hecho de protocolos




var total = " "


for element in [1, 2, 3, 4, 5, 6, 7, 8, 9]{
    
    total = "\(total) -\(element)"
    
}

print(total)

var todos = "mis numeros son:"

for each in words {
    
    todos = "\(todos) \(each)"
    
}

print(todos)

/**/

// (key, value) Es una tupla



for (key, value) in numberNames {
    
    dump("\(key) --- \(value)")
}

/**/

// Tupla - Tipo agregados (en ellos se asocian cosas diferentes).
// Es algo parecido a un objeto pero más trivial


let pair = (1, "one")

pair.0
pair.1

/**/

// 1...5 es un Rango


for i in 1...10{
    
    dump("\(i) * 5 = \(i*5)")
}

/**/

// FUNCIONES

// Son tipos de 1ª clase como en JS.
// Se puede asignar funciones a variables
// Se pueden devolver como valor de retorno de otra función
// Se pueden pasar como parámetros de otra función

// Toda función captura el valor de las variables que estaban en el entorno léxico cuando ella fue creada


func hacerAlgo(conEsteNumero a: Int, yEsteOtro b: Int) -> Int{
    
    return (a + b) * b
    
}

hacerAlgo(conEsteNumero: 3, yEsteOtro: 4)





/**/

// Función sin nombre externo: la variable anónima _


func f(a: Int, _ b:Int) -> Int{
    
    return a + b
}


f(a: 4, 5)

/**/

// Imitamos los métodos de Cocoa que se autocomentan

/**/

func sum(_ a:Int, _ b:Int, thenMultiplyBy c:Int) -> Int {
    
    return (a + b) * c
}

sum(2, 4, thenMultiplyBy: 3)
 

// Parámetros con valores por defecto

func addSuffix(_ a: String, suffix: String = "ingly") -> String {
    
    return a + suffix
}

addSuffix("accord")

addSuffix("Objective", suffix: "C")




/**/

// Las funciones que devuelven muchos valores realmente devuelven una tupla


func nameOf(number a : Int) -> (Int, String, String){
    
    
    var val: (Int, String, String)
    
    switch a{
        
    case 1:
        val = (1, "one", "uno")
        
    case 2:
        val = (2, "two", "tres")
        
    default:
        val = (a, "Go check Google translate", "y dedame en paz")
    }
    
    return(val)
}

let r = nameOf(number: 2)

r.0
r.1
r.2

/**/

// Funciones de alto nivel

typealias IntToInt = (Int) -> Int


var z : IntToInt

func apply(_ f: IntToInt, n: Int) -> Int {
    
    return f(n)
    
}

func doubler(a:Int) -> Int {
     
    return a * 2
    
}


func add42(a:Int) -> Int {
    
    return a + 42
    
}


apply(add42, n: 4)

apply(doubler, n: 4)
    
    
    

/**/

// Funciones como parámetros. Aquí no tenemos que poner @escaping porque f se ejecuta dentro de apply


func compose(_ f: @escaping IntToInt, h: @escaping IntToInt) -> IntToInt {
    
    func comp(a:Int) -> Int {
        
        return f(h(a))
    }
    
    return comp
    
}

let com = compose(add42, h: doubler)

com(8)

/**/



/**/


// Funciones de un mismo tipo, en un array


let funcs = [add42, doubler, com]



for fun in funcs {
    
    print(fun(33))
    
}

/**/


// CLOSURES (Representación literal de funciones)
// Capturan el valor de las variables que estaban en el entorno léxico cuando ella fue creada


func g (a:Int) -> Int {
    
    return a + 42
    
}

/**/

// exactamente igual que ....

let gg = { (a:Int) -> Int in
    
    return a + 42 }

g(a: 1)

gg(1)


/**/

// Sintaxis simplificada de clausuras

let closures : [ (Int) -> Int ] = [g,
                                   { (a:Int) -> Int in return a + 42 },
                                   
                                   {a in return a + 45},
                                   {a in a/42},
                                   {$0 * 42}

                                    ]

closures[2](6)



/**/

// Los operadores son clausuras

typealias BinaryFunc = (Int, Int) -> IntegerLiteralType
let applier = { (f: BinaryFunc, m: Int, n: Int)  -> Int in
    
    return f(m, n)

}

// Podemos pasarle operadores en lugar de una clausura. * es una función
applier( *, 2, 3 )



// Trailing clousure: Cuando la función es pasada como último parámetro


func applierInv(m: Int, n: Int, f: BinaryFunc) -> Int {
    
    return applier(f, m, n)
}


// Puedo hacer esto $ porque la función BinaryFunc dice que entran 2 Int y devuelve otro Int

let c = applierInv(m: 2, n: 4, f: { $0 * 2 + $1 * 3})

// El tercer parámetro queda colgando

let cc = applierInv(m: 2, n: 4) { $0 * 2 + $1 * 3 }


// OPCIONALES - empaqueto algo dentro de un opcional



var maybeAString : String? = "I`m boxed"


//print(maybeAString)

var maybeAnInt : Int?



// desempaquetado seguro por si hubiese un nil

if let certainlyAString = maybeAString {
    
    print("Es una cadena")
    print(certainlyAString)
}


if let certainlyAnInt = maybeAString {
    
    print("Es una entero")
    print(certainlyAnInt)
}



// Desempaquetado peligroso

//var allaVoy : Int = maybeAnInt!

// opcional desempaquetado de forma explícita

/**/
// print(catacrac)

// Optiona Chaining

let n : String? = "Anakin Skywalker"
let nn : String = "Cristobal Jimenez"


// Las funciones que aceptan tipos String pueden también aceptar tipos String?.
// ?. => Es un operador mágico.
// Dichas funciones solo devuelven algo si lo que hay en el opcional no es nil

let firstName = nn.components(separatedBy: " ")
let firstNameAnakin = n?.components(separatedBy: " ")


let caps = firstNameAnakin?[0].uppercased()

print(caps!)


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

enum LightSaberColor {
    
    case blue, red, green, purple
    
}

// STRUCTS
// Se gestionan de forma diferente que las clases.
// Se usan para cosas sencillas y en programación funcional

struct LightSaber {
    
    //Propiedad estatica o de clase
    static let informar = "Una elegante arma del futuro"
    
    // Proiedad computada
    
    var color: LightSaberColor = .blue{
        
        willSet(newValue) {
            
            print("El nuevo color es \(newValue)")
        }
    }
    
    // Propiedad de instancia
    var IsDoubleBlade : Bool = false
    
}

LightSaber.informar

var aa = LightSaber(color: .green, IsDoubleBlade: true)
aa.IsDoubleBlade

aa.color = .red

// CLASS
// REGLAS:
    // Si puedes dar valor por defecto, hazlo.Si no, cea un init
    // Usa opcionale solo cuando sea preciso
    // No uses ! a no ser que sepas lo que estas haciendo

class Jedi {
    
    //variables de instancia
    var lightSaber : LightSaber = LightSaber()
    var name : String = " "
    var midichlorians = 1000
    var master : Jedi?
    var padawan : Jedi?
    
    //variables computadas
    
    var fullName : String {
        
        get{
            var full = name
            
            if let maestro = master {
                full = full + "padawan of \(maestro.name)"
        }
    }
    
    
    
    
    
}



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


