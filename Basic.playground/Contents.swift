// Variable = Mutable

import CoreGraphics
var str = "Hello World"
var x = 4
var y = 1
y = 2

// Constant = Immutable
let z = 3

// Static = Immutable, Instance Once, and Need to go inside of a class
class Person {
    static let age = 17
    let name = "smith"
}

let personOne = Person()
let personTwo = Person()


print(personOne.name)
print(personTwo.name) // You will get difference instance of name from personeOne because personTwo is new instance of Person
print(Person.age) // get static (We don't need to instance the object)

// Types

var a = 3 // Int
var name = "Joe" // String

// Explicitally Type
var lat: String = "123"
var isComplete: Bool = true
let num: Int = 22
let dou: Double = 3.14
var personThree: Person = Person()

// Function
func myFirstFunction() -> Void {
    
}

func addTwoNumbers(a: Int, b: Int) -> Int {
    return a + b
}

let sum = addTwoNumbers(a: x, b: y)

// Class = Need initializer (constructor/init method) whenever we have variable/constant that never be assined by value inside class
class Car {
    let make: String
    var color: String
    
    init(make: String, color: String) {
        self.make = make
        self.color = color
    }
}

struct Vehicle {
    let type: String
    var color: String
    
    init(type: String, color: String) {
        self.type = type
        self.color = color
    }
}

// Class is reference type. bmwRef will be pointing to bmw. Every changes on bmw will change bmwRef
let bmw: Car = Car(make: "bmw", color: "blue")
let bmwRef = bmw
print(bmw.color)
print(bmwRef.color)
bmw.color = "red"
print(bmw.color)
print(bmwRef.color)

// Struct is value type. vehicleCopy is totaly separate from vehicle. Every changes on vehicle won't change vehicleCopy.
// Since struct is value type then it act like variable/constant. We can't edit property when it is an constant, otherwise.
var vehicle: Vehicle = Vehicle(type: "4 wheels", color: "blue")
var vehicleCopy = vehicle
print(vehicle.color)
print(vehicleCopy.color)
vehicle.color = "red"
print(vehicle.color)
print(vehicleCopy.color)


// Loops
let numbers = [1, 2, 3, 4, 5, 6]
for thing in numbers {
    let result = thing * 2
    print(result)
}

var c = 0

while c < 3 {
    print("Test")
    c += 1
}

// Optional (Make variable can be nil)
var e: String? = nil
e = "Hello World"
// Check an Optional is not nil then assign e's value into constanta temp
if let temp = e {
    print(temp)
}

// Conditionals
if c > 0 && y == 2 {
    print("This is a conditional")
} else {
    print("Do nothing")
}

// Guard Statement (Seems like if-else condition but more readable)
func largerThanFive(number: Int) -> Bool {
    guard number > 5 else {
        return false
    }
    // execute when number is larger than 5
    return true
}

print(largerThanFive(number: 7))

// Enum and switch statement
enum States {
    case InProgress, Aborted, Complete
}

var currentShort: States?
currentShort = .InProgress

var currentNormal = States.InProgress

switch currentNormal {
case States.InProgress:
    print("In Progress")
    break
case States.Aborted:
    print("Aborted")
    break
case States.Complete:
    print("Complete")
    break
}

// Protocols
// - Similiar with interface in Java or Kotlin
// - Only contain definition of variable/constant with no initialization and method with no body
// - Common naming convention BlaBlaBlaDelegate or BlaBlaBlaDataSource
protocol PhoneDelegate {
    var color: String { set get }
    
    func call()
    func isSmartphone()
}

class Samsung: PhoneDelegate {
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func call() {
        
    }
    
    func isSmartphone() {
        
    }
}

// Strong vs Weak Memory
// - Init variable is strong by default
// - Weak variable will be deleted from memory if there is no other strong variable pointing to it
class Child {
    weak var friend: Child?
    let name:String

    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }

    deinit {
        print("\(name) is deinitialized")
    }
}

var joe: Child = Child(name: "Joe")
joe.friend = Child(name: "Hana")

// Closure or Lambda
let myFunction: ((Int, Int) -> Bool) = { number, other in
    if number > 3 && other > 3 {
        return true
    }
    
    return false
}

print(myFunction(4, 5))

// String
var first: String = "Steve"
var last: String = "Jobs"

let fullname: String = "\(first) \(last)"
let length = fullname.count

// Array and Dictionary
// Array is enumerated value
let names: [String] = ["John", "Jen", "Marc"]
let numbers2: [Int] = [1, 2, 3]
let anything: [Any] = ["John", "Jen", "Marc", 1, 2, 3]
// Dictionary is key-value
var cars: [String: Int] = ["bmw": 3, "Honda": 1, "Lexus": 12]

for carTemp in cars {
    let result = "\(carTemp.key) - \(carTemp.value)"
    print(result)
}

for (key, value) in cars {
    let result = "\(key) - \(value)"
    print(result)
}

// Numbers
var f = 1 // Int
var g = 1.00 // Double (Int with 2 decimal places)
var h = 1.0000000001 // Float (Int with many more decimal places)

//Typealias
typealias Code = String
var code: Code = ""
func validateCode(code: Code) {
    print(code)
}

typealias Address = [String: String]
var address: Address = ["": ""]
func validateAddress(address: Address) {
    print(address)
}

typealias PromoCodeValidationFunction = ((String) -> Bool)
var validateFunction: PromoCodeValidationFunction

// Ternary
let isLargeThanOne = f > 1 ? true : false
