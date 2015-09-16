//: Closures

func printString(aString: String) {
  println("Printing the passed string: \(aString)")
}

printString("Hi, my lovely")

let someFunction = printString

someFunction("Hiya")

//func printInt(number: Int) {
//  println("\(number)")
//}
//
//let numberOfApples = 3
//
//printInt(numberOfApples)

func displayString(printStringFunc: (String) -> Void) {
  printStringFunc("I'm a function inside another function")
}

displayString(printString)

let allNumbers = [1,2,3,4,5,6,7,8,9,10]

func isEvenNumber(number: Int) -> Bool {
  return number % 2 == 0
}

isEvenNumber(-9000)

let ifEven = isEvenNumber
let evenNumbers = allNumbers.filter(ifEven)

// own

let someString = ["Makka", "Mokko", "Adelaide", "Omnicomni", "Marconi", "Serpent", "Zucchini", "Pasta", "Dolci", "Aurum", "Persistence"]

func containsMagicString(haystack: String) -> Bool {
  return contains(haystack, "a")
}

let getMagic = containsMagicString

let magicWords = someString.filter(getMagic)

// Challenge
func differenceBetweenNumbers(firstNumber: Int, secondNumber: Int) -> (Int) {
  return firstNumber - secondNumber
}

func mathOperation(differenceBetweenNumbers: (Int, Int) -> Int, firstNumber: Int,secondNumber: Int) -> Int {
  return differenceBetweenNumbers(firstNumber, secondNumber)
}

let difference = mathOperation(differenceBetweenNumbers, 4,8)

// Returning Functions




func printerFunction() -> (Int) -> () {
  func printInteger(number: Int) {
    println("The integer passed in is: \(number)")
  }
  return printInteger
}

let printAndReturnIntegerFunc = printerFunction()



printAndReturnIntegerFunc(2)

// Closure Expressions

func doubler(integer: Int) -> Int {
  return integer * 2
}

let doubleFunction = doubler

doubleFunction(3)

let doubledNumbers = allNumbers.map(doubleFunction)

// clsr expression w/ map func
let tripledNumber = allNumbers.map( { (i: Int) -> Int in return i * 3 } )

// clrs expressions w/ sorted func
var names = ["Dan", "Corinna", "Chordelia", "Clonalia", "Dubidu", "Matthew", "Herman"]

func backwards(firstString: String, secondString: String) -> Bool {
  return firstString > secondString
}

// sorted(names, backwards)

let sortedNames = sorted(names, { (firstString: String, secondString: String) -> Bool in return firstString > secondString } )

println(sortedNames)


// Closure Shorthand Syntax

let tripleFunction = { (intNumber: Int) -> Int in return intNumber * 3 }
[1,2,3,4,5,6,7].map(tripleFunction)
// Rule #1
[1,2,3,4,5,6,7].map({ (intNumber: Int) -> Int in return intNumber * 3 })

// Rule #2 inferring type from context
[1,2,3,4,5,6,7].map({ intNumber in return intNumber * 3 })

// Rule #3 implicit returns from single expression closures
[1,2,3,4,5,6,7].map({ intNumber in intNumber * 3 })

// Rule #4 shorthand argument names: $0 - first arg, $1, 2nd etc.
[1,2,3,4,5,6,7].map({ $0 * 3 })

// Rule #5 trailing closures (esp. for long closures
[1,2,3,4,5,6,7].map() { $0 * 3 }

[1,2,3,4,5,6,7].map() {
(var digit) -> Int in
  // let returnValue = digit % 2 == 0 ? digit/2 : digit
  // return returnValue
  if digit % 2 == 0 {
    return digit/2
  } else {
    return digit
  }
}

// Rule #6 Ignoring parentheses
[1,2,3,4,5,6,7].map { $0 * 3 }

// Challenge
let numbers = [Int](0...50)

func isOdd(i: Int) -> Bool {
  return i % 2 != 0
}

let oddNumbers = numbers.filter(isOdd)








