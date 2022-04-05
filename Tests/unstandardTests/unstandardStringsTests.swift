import XCTest
@testable import unstandardStrings
@testable import unstandardStringsFoundation

final class unstandardStringsTests: XCTestCase {
    func testSeparatedRanges() throws {
        let testString = "a-b-c"
        let componentRanges = testString.ranges(separatedBy: .hyphens)
        
        XCTAssertEqual(componentRanges.count, 3)
        XCTAssertEqual(testString[componentRanges[0]], "a")
        XCTAssertEqual(testString[componentRanges[1]], "b")
        XCTAssertEqual(testString[componentRanges[2]], "c")
        
    }
    
    func testOverlappingStrings() {
        XCTAssertEqual("water".suffix(overlappingPrefixOf: "terp"), "ter")
        XCTAssertEqual("eeeabcabc".suffix(overlappingPrefixOf: "abcabcfff"), "abcabc")
        
    }
    
    func testSplitStrings() {
        let testString = "a b c"
        let testOneSplit = testString.split(separator: " ", maxSplits: 1)
        let testTwoSplit = testString.split(separator: " ", maxSplits: 2)
        
        XCTAssertEqual(testOneSplit.count, 2)
        XCTAssertEqual(testOneSplit[0], "a")
        XCTAssertEqual(testOneSplit[1], "b c")
        
        XCTAssertEqual(testTwoSplit.count, 3)
        XCTAssertEqual(testTwoSplit[0], "a")
        XCTAssertEqual(testTwoSplit[1], "b")
        XCTAssertEqual(testTwoSplit[2], "c")
        
    }
    
    func testHeadTailSplit() {
        let testString = "a bb c"
        let testSplitFromStart = testString.headTailSplit(separator: "b", from: .start)
        let testSplitFromEnd = testString.headTailSplit(separator: "b", from: .end)
        
        XCTAssertEqual(testSplitFromStart?.head, "a ")
        XCTAssertEqual(testSplitFromStart?.tail, "b c")
        
        XCTAssertEqual(testSplitFromEnd?.head, "a b")
        XCTAssertEqual(testSplitFromEnd?.tail, " c")
        
    }
    
}

extension unstandardStringsTests {
    func testLineRanges() {
        let testString = "test\n"
        var lines: [Substring] = []
        
        lines = Array(testString.lineRanges(.forward, includeEmptyLines: false))
            .map { testString[$0] }
        
        XCTAssertEqual(lines[0], "test")
        XCTAssertEqual(lines.count, 1)
        
        lines = Array(testString.lineRanges(.forward, includeEmptyLines: true))
            .map { testString[$0] }
        
        XCTAssertEqual(lines[0], "test")
        XCTAssertEqual(lines[1], "")
        XCTAssertEqual(lines.count, 2)
        
        lines = Array(testString.lineRanges(.backward, includeEmptyLines: false))
            .map { testString[$0] }
        
        XCTAssertEqual(lines[0], "test")
        XCTAssertEqual(lines.count, 1)
        
        lines = Array(testString.lineRanges(.backward, includeEmptyLines: true))
            .map { testString[$0] }
        
        XCTAssertEqual(lines[0], "")
        XCTAssertEqual(lines[1], "test")
        XCTAssertEqual(lines.count, 2)
        
        //
        
        let testString2 = "test\ntest"
        
        lines = Array(testString2.lineRanges(.forward, includeEmptyLines: false))
            .map { testString2[$0] }
        
        XCTAssertEqual(lines[0], "test")
        XCTAssertEqual(lines[1], "test")
        XCTAssertEqual(lines.count, 2)
        
        lines = Array(testString2.lineRanges(.forward, includeEmptyLines: true))
            .map { testString2[$0] }
        
        XCTAssertEqual(lines[0], "test")
        XCTAssertEqual(lines[1], "test")
        XCTAssertEqual(lines.count, 2)
        
        lines = Array(testString2.lineRanges(.backward, includeEmptyLines: false))
            .map { testString2[$0] }
        
        XCTAssertEqual(lines[0], "test")
        XCTAssertEqual(lines[1], "test")
        XCTAssertEqual(lines.count, 2)
        
        lines = Array(testString2.lineRanges(.backward, includeEmptyLines: true))
            .map { testString2[$0] }
        
        XCTAssertEqual(lines[0], "test")
        XCTAssertEqual(lines[1], "test")
        XCTAssertEqual(lines.count, 2)
        
        
        //
        
        let testString3 = "test\ntest\n"
        
        lines = Array(testString3.lineRanges(.forward, includeEmptyLines: false))
            .map { testString3[$0] }
        
        XCTAssertEqual(lines[0], "test")
        XCTAssertEqual(lines[1], "test")
        XCTAssertEqual(lines.count, 2)
        
        lines = Array(testString3.lineRanges(.forward, includeEmptyLines: true))
            .map { testString3[$0] }
        
        XCTAssertEqual(lines[0], "test")
        XCTAssertEqual(lines[1], "test")
        XCTAssertEqual(lines[2], "")
        XCTAssertEqual(lines.count, 3)
        
        lines = Array(testString3.lineRanges(.backward, includeEmptyLines: false))
            .map { testString3[$0] }
        
        XCTAssertEqual(lines[0], "test")
        XCTAssertEqual(lines[1], "test")
        XCTAssertEqual(lines.count, 2)
        
        lines = Array(testString3.lineRanges(.backward, includeEmptyLines: true))
            .map { testString3[$0] }
        
        XCTAssertEqual(lines[0], "")
        XCTAssertEqual(lines[1], "test")
        XCTAssertEqual(lines[2], "test")
        XCTAssertEqual(lines.count, 3)
        
    }
    
}
