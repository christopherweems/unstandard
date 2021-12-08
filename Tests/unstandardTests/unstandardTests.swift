import XCTest
@testable import unstandard

final class unstandardTests: XCTestCase {
    
    
    // MARK: - String Builder Tests
    
    fileprivate var content: String? { "feature presentation" }
    
    @StringBuilder<NewLine> fileprivate var htmlBody: String {
        "<h1>Title</h1>"
        if let content = self.content {
            "<p>\(content)</p>"
            
        } else {
            #"<p class="no-content">No Content</p>"#
            
        }
        
        "<nav>...</nav>"
    }
    
    @StringBuilder<NewLine> fileprivate func webPage(withBody body: String) -> String {
        "<html>"
        "<body>"
        body
        "</body>"
        "</html>"
    }
    
    func testStringBuilder() {
        let page = webPage(withBody: htmlBody)
        
        XCTAssert(page.contains("</body>"))
        XCTAssert(page.contains(content!))
    }
    
    
    // MARK: - String Join
    
    func testStringJoin() {
        let joined: String = .joining(separator: Semicolon.self) {
            "A"
            "B"
        }
        
        XCTAssertEqual(joined, "A;B")
        
        let joined2 = EmptyJoin.joining {
            "A"
            "B"
        }
        
        XCTAssertEqual(joined2, "AB")
    }

    
    // MARK: - Remove Camel Case
    
    func testRemoveCamelCase() {
        let camelCaseString = "camelCaseString"
        let withoutCamelCase = camelCaseString.removeCamelCase(separator: " ")
        XCTAssertEqual(withoutCamelCase, "Camel Case String")
        
        let other = "Other"
        let otherWithoutCamelCase = other.removeCamelCase(separator: " ")
        XCTAssertEqual(otherWithoutCamelCase, "Other")
    }
    
    
    // MARK: - Ordered Set Result
    
    func testOrderedSetResult() {
        @OrderedSetResult var testSet: OrderedSet<Int> {
            1
            3
            2
            0
        }
        
        XCTAssertEqual(testSet.elements, [1, 3, 2, 0])
    }
    
}

fileprivate extension Int {
    var isEven: Bool { self % 2 == 0 }
    
}

extension unstandardTests {
    func testCollectionDivision() {
        let numbers = [1,2,3,4,5]
        let evenAndOdd = numbers.divide(on: \.isEven)
        
        XCTAssertEqual(evenAndOdd[0], [2,4])
        XCTAssertEqual(evenAndOdd[1], [1,3,5])
        
    }
    
}
