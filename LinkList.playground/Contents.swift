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
    var next: Node?
    var previous: Node?
    
    public init(value:T) {
        self.value = value
    }
    
}

public class LinkedList<T> {
    
    
    private var head: Node<T>?
    
    
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
    
    
    public var count: Int {
        guard var node = head else {return 0}
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    
    public var print: String {
        var stringArray = "["
        guard var node = head else {return "[]"}
        while let next = node.next {
            stringArray += "\(node.value), "
            node = next
        }
        stringArray += "\(node.value)"
        return stringArray + "]"
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
    
    
    public func node(atIndex index:Int) -> Node<T> {
        if index == 0 {
            return head!
        } else {
            var node = head?.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {break}
            }
            return node!
        }
    }
    
    
    public func insert(value:T, atIndex index: Int) {
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
        let prev = node(atIndex: index - 1)
            let next = prev.next
            newNode.previous = prev
            newNode.next = prev.next
            
            prev.next = newNode
            next?.previous = newNode
        }
    }
    
    
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
        head = next
        }
        next?.previous = prev
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    
    public func removeAt(_ index: Int) -> T {
        let nodeToRemove = node(atIndex: index)
        return remove(node: nodeToRemove)
    }
    
}



let list = LinkedList<String>()





