import XCTest
@testable import PriorityQueue


class HeapTests: XCTestCase {
    
    var iheap: PriorityQueue<Int>.ArrayHeap!
    
    override func setUp() {
        super.setUp()

        iheap = PriorityQueue.ArrayHeap()
    }
    
    func testTopElementWhenSingle() {
        iheap.add(42)
        
        XCTAssertEqual(iheap.removeTop(), 42)
    }

    func testTopElementWhenEmpty() {
        XCTAssertNil(iheap.removeTop())
    }

    func testTopElementWhenTwoInOrder() {
        iheap.add(2)
        iheap.add(4)
        
        XCTAssertEqual(iheap.removeTop(), 2)
    }

    func testTopElementWhenTwoNotInOrder() {
        iheap.add(4)
        iheap.add(2)
        
        XCTAssertEqual(iheap.removeTop(), 2)
    }

    func testRandomCheck() {
        continueAfterFailure = false

        for n in 1..<100 {
            var items:[Int] = []

            for _ in 0..<n {
                let x = Int(arc4random_uniform(100)) - 50
                items.append(x)
                iheap.add(x)
            }

            for x in items.sorted() {
                XCTAssertEqual(iheap.removeTop(), x, "\(items)")
            }
        }
    }
}
