import UIKit

import Foundation
//TASK 1
struct CartProductResult {
var id: Int
var title: String
var quantity: Int
}
let cartProducts = [
CartProductResult(id: 1, title: "nike shoe 1", quantity: 5),
CartProductResult(id: 2, title: "nike shoe 2", quantity: 2),
CartProductResult(id: 3, title: "soap", quantity: 6)
]
for item in cartProducts {
    print("* \(item.id)-\(item.title)")
}

//TASK 2

struct SearchProductResult {
var id: Int
var title: String
var position: Int
}

let productList: [SearchProductResult] = [
SearchProductResult(id: 1, title: "nike shoe 3", position: 1),
SearchProductResult(id: 5, title: "pen", position: 2)
]

protocol Printable {
    func printIt()
}

extension CartProductResult : Printable {
    func printIt () {
        print("* \(self.id)-\(self.title)")
    }

}
extension SearchProductResult : Printable {
    func printIt () {
        print("* \(self.id)-\(self.title)")
    }

}

func printProductDetails <T : Printable> (list : [T]) {
        for item in list {
            item.printIt()
        }
}
printProductDetails(list: cartProducts)
printProductDetails(list: productList)

//TASK 3
func printWithDelay(product1: CartProductResult, product2:
CartProductResult, completion: (@escaping ()-> Void)) {
// Write your code implementation here
    let blockOp2 = BlockOperation()
    blockOp2.addExecutionBlock {
        do {
            sleep(1)
        }
        print("wait for 1 second")
        print(product1.id)
    }
    let blockOp3 = BlockOperation()
    blockOp3.addExecutionBlock {
        do {
            sleep(1)
        }
        print("wait for 1 second")
        print(product2.id)
    }
    blockOp3.addDependency(blockOp2)
    let opQ = OperationQueue()
    opQ.addOperations([blockOp2,blockOp3], waitUntilFinished: false)
}

printWithDelay(product1: cartProducts[0], product2: cartProducts[1])
{
    print("Done printing products")
}

//TASK 4

let json = """
{
"id": "1",
"options": [
{
"id": "11",
"options": [
{
"id": "111",
"options": []
}
]
},
{
"id": "2",
"options": [
{
"id": "21",
"options": []
},
{
"id": "22",
"options": [
{
"id": "221",
"options": []
}
]
}
]
}
]
}
"""

struct Jdata: Codable {
    let id: String
    let options: [Jdata]
    private enum CodingKeys: String, CodingKey {
            case id = "id"
            case options = "options"
    }
}


func printAllData (jD : [Jdata] ) {
    for item in jD {
            print(item.id)
            printAllData(jD: item.options)
    }
}
let data = json.data(using: .utf8)!
do {
    let f : Jdata = try JSONDecoder().decode(Jdata.self, from: data)
    print(f.id)
    printAllData(jD: f.options)
        
} catch {
    print(error)
}
