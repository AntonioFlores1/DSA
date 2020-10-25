import UIKit

var str = "Hello, playground"

// A linklist is a collection of Node which contain data, with pointers to previous and next Node

///Step 1 — create a Node class
///Step 2 — create a LinkedList class
///Step 3 — provide a last Node
///Step 4 — add the ability to append Nodes
///Step 5 — fetch the number Nodes in a LinkedList
///Step 6 — print each Node value from a LinkedList
///Step 7 —fetch a Node from a specified index
///Step 8 — insert a Node at a specific index
///Step 9 — remove a Node at a specific index


public class Node<T> {
    var value: T
    var next: Node? //Connects to next Node
    var previous: Node?
    
    public init(value:T) {
        self.value = value
    }
    
}

public class LinkedList<T> {
    
    private var head: Node<T>?
//    public var first: Node<T>?
    
    public var first:Node<T>? {
        return head
    }
    
    public var last:Node<T>? {
        guard var node = head else {return nil}
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public func append(value:T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            last?.next = newNode
        } else {
            head = newNode
        }
    }
        
        
        
}










