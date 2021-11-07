import Foundation

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }

    
    public class func showList(head: ListNode?){
        
        guard let headNode = head else {
            return
        }
        
        var node: ListNode = headNode
        var listChar: String = "head:\(node.val)"
        repeat{
            
            listChar.append("->")
            listChar.append("\(node.next!.val)")
            node = node.next!
        } while node.next != nil
        
        print("\(listChar)")
    }
}
