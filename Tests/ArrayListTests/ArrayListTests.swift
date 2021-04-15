import XCTest
@testable import ArrayList

func check(builder: ()-> ArrayList<Int>, array: Array<Int>) {
    XCTAssertTrue(builder().elements == array)
}

final class ArrayListTests: XCTestCase {

    func testExample() {
        check(builder: { ArrayList() }, array: [])
        check(builder: { ArrayList([1]) }, array: [1])
        check(builder: { ArrayList(1, 2) }, array: [1, 2])
        let list = ArrayList(1, 2, 3)
        check(builder: { ArrayList(list) }, array: [1, 2, 3])
        XCTAssertTrue(list[0] == 1)
        XCTAssertTrue(list[0..<2] == [1, 2])
        check(builder: { () -> ArrayList<Int> in
            list.append(newElement: 4)
            return list
        }, array: [1,2,3,4])
        check(builder: { () -> ArrayList<Int> in
            list.insert(newElement: 3, atIndex: 3)
            return list
        }, array: [1,2,3,3,4])
        check(builder: { () -> ArrayList<Int> in
            list.removeAtIndex(index: 1)
            return list
        }, array: [1,3,3,4])
        check(builder: { () -> ArrayList<Int> in
            list.removeLast()
            return list
        }, array: [1,3,3])
        check(builder: { () -> ArrayList<Int> in
            list.removeAll()
            return list
        }, array: [])
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
