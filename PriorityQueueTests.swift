
import XCTest


class PriorityQueueTests: XCTestCase {

    var iqueue: PriorityQueue<Int>!
    var iarr: [Int]!
    
    override func setUp() {
        super.setUp()

        iqueue = PriorityQueue()
        iarr = []
    }
    
    func testTopElementWhenSingle() {
        iqueue.add(42)

        XCTAssertEqual(iqueue.count, 1)
        XCTAssertEqual(iqueue.pop(), 42)
        XCTAssertEqual(iqueue.count, 0)
    }

    func testTopElementWhenEmpty() {
        XCTAssertEqual(iqueue.count, 0)
        XCTAssertNil(iqueue.pop())
        XCTAssertEqual(iqueue.count, 0)
    }

    func testTopElementWhenDuplicate() {
        iqueue.add(42)
        iqueue.add(18)
        iqueue.add(42)
        
        XCTAssertEqual(iqueue.count, 3)
        XCTAssertEqual(iqueue.pop(), 18)
        XCTAssertEqual(iqueue.pop(), 42)
        XCTAssertEqual(iqueue.pop(), 42)
        XCTAssertEqual(iqueue.count, 0)
    }

    func testRandomCheck() {
        continueAfterFailure = false
        
        for n in 1..<100 {
            var items:[Int] = []
            
            for _ in 0..<n {
                let x = Int(arc4random_uniform(100)) - 50
                items.append(x)
                iqueue.add(x)
            }
            
            XCTAssertEqual(iqueue.count, n)
            
            for x in items.sorted() {
                XCTAssertEqual(iqueue.pop(), x, "\(items)")
            }
            
            XCTAssertEqual(iqueue.count, 0)
        }
    }
    
    func testSequence() {
        iqueue.add(3)
        iqueue.add(5)
        iqueue.add(1)
        iqueue.add(4)
        XCTAssertEqual(iqueue.count, 4)

        var items: [Int] = []
        for x in iqueue {
            items.append(x)
        }
        
        XCTAssertEqual(items, [1, 3, 4, 5])
        
        XCTAssertEqual(iqueue.count, 4)
    }

    func testClear() {
        iqueue.add(42)
        
        iqueue.clear()
        XCTAssertEqual(iqueue.count, 0)
    }
}
