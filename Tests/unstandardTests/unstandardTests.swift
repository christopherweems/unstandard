import XCTest
@testable import unstandard

final class unstandardTests: XCTestCase {
    static var allTests = [
        ("testStringBuilder", testStringBuilder),
        ("testRemoveCamelCase", testRemoveCamelCase),
        
    ]
}


// MARK: - String Builder Tests

extension unstandardTests {
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
    
}

extension unstandardTests {
    func testRemoveCamelCase() {
        let camelCaseString = "camelCaseString"
        let withoutCamelCase = camelCaseString.removeCamelCase(separator: " ")
        XCTAssertEqual(withoutCamelCase, "Camel Case String")
        
        let other = "Other"
        let otherWithoutCamelCase = other.removeCamelCase(separator: " ")
        XCTAssertEqual(otherWithoutCamelCase, "Other")
    }
    
}
