import XCTest
import unstandard
@testable import unstandardStrings

final class unstandardStringsTests: XCTestCase {
    func testSeparatedRanges() throws {
        let testString = "a-b-c"
        let componentRanges = testString.ranges(separatedBy: .hyphens)
        
        XCTAssertEqual(componentRanges.count, 3)
        XCTAssertEqual(testString[componentRanges[0]], "a")
        XCTAssertEqual(testString[componentRanges[1]], "b")
        XCTAssertEqual(testString[componentRanges[2]], "c")
        
    }
    
}
