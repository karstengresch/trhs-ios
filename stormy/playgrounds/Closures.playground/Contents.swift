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

