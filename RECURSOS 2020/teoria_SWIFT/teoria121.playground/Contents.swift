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

func foo(nombre: String?, _ edad: Int?) -> Bool {
    
    guard nombre != nil || edad != nil else{
        print("La fastidiamos")
        return false
    }
    
    guard let name = nombre else {
        print("Como no se tu nombre no me interesa tu edad")
        return false
    }
    
    guard let age = edad else {
        print("Su nombre es \(name) pero  no sé su edad")
        return false
    }
    
    
    print("Su nombre es \(name) y su edad es \(age)")
    
    return true
}
//foo(nombre: "Ana", 22)
// foo(nombre: nil, nil)
// foo(nombre: nil, 23)
foo(nombre: "Luis", nil)


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
            return full
    }

}
    
    
    init(name: String, midichlorians: Int, lightSaber : LightSaber, master : Jedi?, padawan : Jedi?){
        
        self.name = name
        self.midichlorians = midichlorians
        self.lightSaber = lightSaber
        self.master = master
        self.padawan = padawan
        
    }
    
}

//let pepe = Jedi(name: "Pepe", midichlorians: 1000, lightSaber: LightSaber(), master: nil, padawan: nil)



//: ## Herencia
// No crea init designados en una subclase porque dejarás de heredar el init del padre
// Si se añaden propiedades deben tener valor o ser opcionales

/**/



//CLASES Y ESTRUCTURAS

class Persona{
    
    var nombre : String = "Pedro"
    var edad : Int
    
    init(edad: Int){
        self.edad = edad
    }
    
}

let personaUno = Persona(edad: 24)

print("Me llamo \(personaUno.nombre)")

var personaDos = personaUno

personaDos.nombre = "Sergio"

print("Me llamo \(personaDos.nombre)")

print("¿Como que me llamo \(personaUno.nombre)")


struct Person {
    
    var name = "Pedro"
    
    var age : Int
}

let personOne = Person(age: 24)

print("Me llamo \(personOne.name)")

var personTwo = personOne

personTwo.name = "Sergio"

print("Me llamo \(personTwo.name)")


struct Actor{
    var name: String
    var friendsName: String
    
    
}

let actor1 = Actor(name: "Jennifer Aniston", friendsName: "Rachel Green")

var actor2 = actor1

actor2.name = "David Schwimmer"
actor2.friendsName = "Ross Geller"

actor1.name
actor2.name

class Friends {
    var title: String
    let coffeShop: String
    var actors: [Actor]?
    
    init(title: String, coffeShop: String){
        
        self.title = title
        self.coffeShop = coffeShop
    }
    
    convenience init(title: String, coffeShop: String, actors:[Actor]){
        
        self.init(title: title, coffeShop: coffeShop)
        self.actors = actors
    }
    
}

let serie = Friends(title: "Friends", coffeShop: "Central Perk")
let serie2 = Friends(title: "Friends", coffeShop: "Central Perk", actors: [])

serie2.actors
serie2.actors?.append(actor1)
serie2.actors?.append(actor2)

serie2.actors?.first?.name

serie2.actors?.append(contentsOf: [

        Actor(name: "Matt Leblanc", friendsName: "Joey Tribbiani"),
        Actor(name: "Lisa Kudrow", friendsName: "Phoebe Buffay"),
        Actor(name: "Courteney Cox", friendsName: "Monica Geller"),
        Actor(name: "Matthew Perry", friendsName: "Chandler Bing"),

])

// CLOSURES


let actors: [Actor] = []

serie2.actors?.forEach { actor in
    print(actor.name)
}

serie2.actors?.forEach{ print($0.name)}

if let actors = serie2.actors{
    for actor in actors {
        print(actor.name)
    }
}

//Tres formas distintas dehacer lo mismo en CLOSURES

func sayHellowActors(to name : String){
    serie2.actors?.forEach{ (actor) in
        print("Saludos de \(actor.name) a \(name)")
    }
}

sayHellowActors(to: "David")

var completionHandlers = [(String) -> Void]()

func loadJoeyPizza(callback: @escaping (String) -> Void ){
    completionHandlers.append(callback)
}

loadJoeyPizza {name in
    print("Joey ha comido en \(name)")
}

loadJoeyPizza { print("Raquel a comido en \($0)") }

completionHandlers.forEach { $0("Pizzería de Don Cangrejo")}


let actorFiltered = serie2.actors?.filter{ actor -> Bool in
    return actor.name.count > 15
}

print(actorFiltered ?? [])

let actorfiltered2 = serie2.actors?.filter{ $0.name.count > 14 }

print(actorfiltered2 ?? [])

if let actors = serie2.actors {
    
    var actorName: [String] = []
    
    for each in actors {
        actorName.append(each.name)
    }

    print(actorName)

}

let actorsName = serie2.actors?.map{ $0.name }

print(actorsName ?? [])

serie2.actors?.compactMap{ $0.name}

let actorW = serie2.actors?.first(where: { actor -> Bool in
    return actor.name.contains("w")
})

print(actorW?.name ?? "")

var numbers = [1, 5, 6, 12, 8, 7]

let result = numbers.reduce(0) { (suma, number) -> Int in
    return suma + number
}

print(result)

let actorsNamecount = serie2.actors?.reduce(0) { (totalCount, actor) -> Int in
    return totalCount + actor.name.count
}

print(actorsNamecount ?? 0)

let actorsNamecount2 = serie2.actors?.reduce(0) { $0 + $1.name.count }

print(actorsNamecount ?? 0)

// Exensiones
// Añadir código a clases preexistentes
// No se pueden añadir propiedades stored (de instancia)
// No se pueden añadir inits designados, sí de conveniencia

struct CoffeeShop {
    var clients: [String]
    var coffees: Int
    
    var coffeesPerClient: Float{
        get {
            return Float(coffees / clients.count)
        }
        set{
            coffees = Int(newValue) * clients.count
        }
    }
}

var cafeteriaBBAA = CoffeeShop(clients: ["Cristobal","Anotonio","Cristina", "David", "Belen", "Manuel", "Andreu", "Fernando"], coffees: 16)

cafeteriaBBAA.coffeesPerClient
cafeteriaBBAA.coffeesPerClient = 3

cafeteriaBBAA.coffees

cafeteriaBBAA.clients.count

struct CoffeeShopObservers {
    var coffees: Int{
        willSet(newTotalCoffees){
            print("Viene más café: \(newTotalCoffees)")
        }
        didSet{
            print("Tenemos ya más café: \(coffees)")
        }
    }
}

var vigiloCafes = CoffeeShopObservers(coffees: 1)

vigiloCafes.coffees = 4

//EXTENSIONES
// Añaden codigo a clases preexistentes

typealias Euro = Double

extension Euro {
    
    var _€: Double{
        return self
    }
    
    var _$: Double{
        return self * 0.8
    }
    
    var yen: Double{
        return self * 0.008
    }
    
    var rub: Double{
        return self * 0.01
    }
}

var totalEuros : Euro = 123._€ + 45.08._$ + 3400.yen + 2800.rub

typealias Task = () -> Void

extension Int {
    
    mutating func square(){
        self = self * self
    }
    
    func isGreaterThan(other: Int) -> Bool {
        return self > other
    }
    
    func times(task: Task){
        for _ in 1...self {
            task()
        }
    }
}

var ageExtension = 8

ageExtension.square()
ageExtension.isGreaterThan(other: 10)

4.times {
    print("Ya hemos terminado")
}

extension String {
    
    func numberOf(char: String) -> Int {
        
        return self.filter { stringChar -> Bool in
            return char.compare("\(stringChar)") == .orderedSame
        }.count
    }
    
}

var stringExtension = "Curso de Apps para ios con Swift, muy chulo"
stringExtension.numberOf(char: "u")



// GESTIÓN DE ERRORES
// Palabrejas: try, throw, throws, catch, do
// toda función que pueda generar errores esta marcada con throw
// Toda función que lanza errores es llamada con try

func inverse(_ n: Double) throws -> Double {
    guard n != 0 else{
       throw NSError(domain: "Dividir por 0 no se puede", code: 402, userInfo: nil)
    }
    return 1/n
}


do {
    try inverse(42)
} catch  {
    print("La fatidiamos! \(error.localizedDescription)")
}


// ENUM

enum LetterType: CaseIterable {
    case love
    case business
    case family
    case friends
}

let letterType1 = LetterType.family
let letterType2 = LetterType.love

LetterType.allCases

enum MailboxProperties {
    
    case capacity(Int)
    case addres(String)
}

var mailboxProperty = MailboxProperties.capacity(50)
mailboxProperty = .addres("Puerta del Sol, Madrid")

var rojo = UIColor.blue

rojo = .red

let mailBoxType = MailboxProperties.capacity(30)

switch(mailBoxType) {
    case MailboxProperties.capacity(let count): print("La capacidad es \(count)")
case MailboxProperties.addres(let adress): print("La direccion es \(adress)")
}

enum LetterSizes: Int {
    case small = 10
    case medium = 20
    case big = 30
}
let letterSize = LetterSizes(rawValue: 1)

enum LetterName:String {
    case initial = "hello"
    case close = "goodbye"
}

// GENERICOS

let nums: [Int] = [1, 2, 3, 4]
let numss: Array<Int> = [5, 6, 7, 8]


let dict : [String : Int]?
let dict2 : Dictionary<String, Int>?

var maybeDouble : Double?
var maybeInt : Optional<Int>

var arrayString = ["Hola", "Adios", "Hastaluego", "quetal"]
var arrayInt = [1, 2, 3, 4, 5, 6]
var arrayDouble = [1.0, 2.0, 3.0, 4.0]

//Funcion generica

func enumerarElementosArray<T>(array: [T]){
    for elemento in array {
        print(elemento)
    }
}

enumerarElementosArray(array: arrayString)
enumerarElementosArray(array: arrayInt)
enumerarElementosArray(array: arrayDouble)

//Clase Generica

class Pair<Left, Right>{
    let left : Left
    let right : Right
    
    init(left: Left, right: Right) {
    
    self.left = left
    self.right = right
   }
  }

let p1 = Pair(left: 4, right: "Hola")


//Genericos con restricciones

class Bucket<Value: Hashable>{
    let val: Value
    init(val: Value){
        self.val = val
    }
}

//let b2 = Bucket(val: p1)

//PROTOCOLOS y DELEGADOS

protocol ActorsFriendProtocol {
    var name: String {get set}
    var films: [String] {get set}
    func sayHello()
}

class ActorProtocol : ActorsFriendProtocol{
    var name: String = ""
    
    var films: [String] = []
    
    func sayHello() {
        print("Hola Actor")
    }
    
    var lastName: String = ""
    
    func sayGoodbye() {
        print("Adios Actor")
    }
}


let actorUno : ActorProtocol = ActorProtocol()

actorUno.sayGoodbye()

let actorDos : ActorsFriendProtocol = ActorProtocol()

actorDos.sayHello()

// PATRON



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

//let nums = [1,2,3,4,5]
//let numss : Array<Int> = [1,2,3,4,5]
//
//let dict : Dictionary<String, Int>?
//
//let maybeADouble : Optional<Double>


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


