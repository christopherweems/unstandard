// Tests from https://github.com/cliss/TreePrinter

import XCTest
@testable import CustomDebugTreeConvertible

class CustomDebugTreeConvertibleTests: XCTestCase {
    func testVanillaSetup() {
        let tree = TreeNode.sampleTree
        let result = TreeFormatter.format(tree)
        print(result)
        let lines = result.split(separator: "\n")
        XCTAssertEqual(lines.count, 7)
        XCTAssertEqual(lines[0], "Root")
        
        XCTAssert(lines[1].starts(with: "├── "))
        XCTAssert(lines[1].contains("Branch Depth One A"))
        
        XCTAssert(lines[2].contains("│"))
        XCTAssert(lines[2].contains("├"))
        XCTAssert(lines[2].contains("Branch Depth Two A"))
        
        XCTAssert(lines[3].contains("│"))
        XCTAssert(lines[3].contains("├"))
        XCTAssert(lines[3].contains("Branch Depth Two B"))
        
        let regex = try! NSRegularExpression(pattern: "│", options: .ignoreMetacharacters)
        
        XCTAssertEqual(2, regex.numberOfMatches(in: String(lines[4]), options: .withTransparentBounds, range: NSRange(lines[4].startIndex..., in: lines[4])))
        XCTAssert(lines[4].contains("└"))
        XCTAssertFalse(lines[4].contains("├"))
        XCTAssert(lines[4].contains("Leaf Depth Three"))
        
        XCTAssert(lines[5].contains("│"))
        XCTAssert(lines[5].contains("└"))
        XCTAssert(lines[5].contains("Branch Depth Two C"))
        
        XCTAssertFalse(lines[6].contains("|"))
        XCTAssert(lines[6].contains("└"))
        XCTAssert(lines[6].contains("Branch Depth One B"))
        
    }
    
    func testAlternateSetup() {
        let tree = TreeNode.sampleTree
        let result = TreeFormatter.format(tree, options: .alternateDefaults)
        print(result)
        let lines = result.split(separator: "\n")
        XCTAssertEqual(lines.count, 7)
        XCTAssertEqual(lines[0], "Root")
        
        XCTAssert(lines[1].starts(with: "+-- "))
        XCTAssert(lines[1].contains("Branch Depth One A"))
        
        XCTAssert(lines[2].contains("|"))
        XCTAssert(lines[2].contains("+"))
        XCTAssert(lines[2].contains("Branch Depth Two A"))
        
        XCTAssert(lines[3].contains("|"))
        XCTAssert(lines[3].contains("+"))
        XCTAssert(lines[3].contains("Branch Depth Two B"))
        
        let regex = try! NSRegularExpression(pattern: "|", options: .ignoreMetacharacters)
        
        XCTAssertEqual(2, regex.numberOfMatches(in: String(lines[4]), options: .withTransparentBounds, range: NSRange(lines[4].startIndex..., in: lines[4])))
        XCTAssert(lines[4].contains("`"))
        XCTAssertFalse(lines[4].contains("+"))
        XCTAssert(lines[4].contains("Leaf Depth Three"))
        
        XCTAssert(lines[5].contains("|"))
        XCTAssert(lines[5].contains("`"))
        XCTAssert(lines[5].contains("Branch Depth Two C"))
        
        XCTAssertFalse(lines[6].contains("|"))
        XCTAssert(lines[6].contains("`"))
        XCTAssert(lines[6].contains("Branch Depth One B"))
        
    }
    
    func testHugeDepth() {
        let tree = TreeNode.sampleTree
        let options = CustomTreeFormatting(spacesPerDepth: 10)
        let result = TreeFormatter.format(tree, options: options)
        print(result)
        let lines = result.split(separator: "\n")
        XCTAssertEqual(lines.count, 7)
        XCTAssertEqual(lines[0], "Root")
        
        XCTAssert(lines[1].starts(with: "├── "))
        XCTAssert(lines[1].contains("Branch Depth One A"))
        
        XCTAssert(lines[2].contains(options.verticalLine))
        XCTAssert(lines[2].contains(options.intermediateConnector))
        XCTAssert(lines[2].contains("Branch Depth Two A"))
        
        XCTAssert(lines[3].contains(options.verticalLine))
        XCTAssert(lines[3].contains(options.intermediateConnector))
        XCTAssert(lines[3].contains("Branch Depth Two B"))
        
        let regex = try! NSRegularExpression(pattern: options.verticalLine, options: .ignoreMetacharacters)
        
        XCTAssertEqual(2, regex.numberOfMatches(in: String(lines[4]), options: .withTransparentBounds, range: NSRange(lines[4].startIndex..., in: lines[4])))
        XCTAssert(lines[4].contains(options.finalConnector))
        XCTAssertFalse(lines[4].contains(options.intermediateConnector))
        XCTAssert(lines[4].contains("Leaf Depth Three"))
        
        XCTAssert(lines[5].contains(options.verticalLine))
        XCTAssert(lines[5].contains(options.finalConnector))
        XCTAssert(lines[5].contains("Branch Depth Two C"))
        
        XCTAssertFalse(lines[6].contains(options.verticalLine))
        XCTAssert(lines[6].contains(options.finalConnector))
        XCTAssert(lines[6].contains("Branch Depth One B"))
        
    }
    
    func testAlternateSpacer() {
        let tree = TreeNode.sampleTree
        let options = CustomTreeFormatting(spacer: "@")
        let result = TreeFormatter.format(tree, options: options)
        print(result)
        let lines = result.split(separator: "\n")
        XCTAssertEqual(lines.count, 7)
        XCTAssertEqual(lines[0], "Root")
        
        XCTAssert(lines[1].starts(with: "├── "))
        XCTAssert(lines[1].contains("Branch Depth One A"))
        
        XCTAssert(lines[2].contains(options.verticalLine))
        XCTAssert(lines[2].contains(options.intermediateConnector))
        XCTAssert(lines[2].contains("Branch Depth Two A"))
        
        XCTAssert(lines[3].contains(options.verticalLine))
        XCTAssert(lines[3].contains(options.intermediateConnector))
        XCTAssert(lines[3].contains("Branch Depth Two B"))
        
        let regex = try! NSRegularExpression(pattern: options.verticalLine, options: .ignoreMetacharacters)
        
        XCTAssertEqual(2, regex.numberOfMatches(in: String(lines[4]), options: .withTransparentBounds, range: NSRange(lines[4].startIndex..., in: lines[4])))
        XCTAssert(lines[4].contains(options.finalConnector))
        XCTAssertFalse(lines[4].contains(options.intermediateConnector))
        XCTAssert(lines[4].contains("Leaf Depth Three"))
        
        XCTAssert(lines[5].contains(options.verticalLine))
        XCTAssert(lines[5].contains(options.finalConnector))
        XCTAssert(lines[5].contains("Branch Depth Two C"))
        
        XCTAssertFalse(lines[6].contains(options.verticalLine))
        XCTAssert(lines[6].contains(options.finalConnector))
        XCTAssert(lines[6].contains("Branch Depth One B"))
        
    }
    
    func testAlternateVerticalLine() {
        let tree = TreeNode.sampleTree
        let options = CustomTreeFormatting(verticalLine: "$")
        let result = TreeFormatter.format(tree, options: options)
        print(result)
        let lines = result.split(separator: "\n")
        XCTAssertEqual(lines.count, 7)
        XCTAssertEqual(lines[0], "Root")
        
        XCTAssert(lines[1].starts(with: "├── "))
        XCTAssert(lines[1].contains("Branch Depth One A"))
        
        XCTAssert(lines[2].contains(options.verticalLine))
        XCTAssert(lines[2].contains(options.intermediateConnector))
        XCTAssert(lines[2].contains("Branch Depth Two A"))
        
        XCTAssert(lines[3].contains(options.verticalLine))
        XCTAssert(lines[3].contains(options.intermediateConnector))
        XCTAssert(lines[3].contains("Branch Depth Two B"))
        
        let regex = try! NSRegularExpression(pattern: options.verticalLine, options: .ignoreMetacharacters)
        
        XCTAssertEqual(2, regex.numberOfMatches(in: String(lines[4]), options: .withTransparentBounds, range: NSRange(lines[4].startIndex..., in: lines[4])))
        XCTAssert(lines[4].contains(options.finalConnector))
        XCTAssertFalse(lines[4].contains(options.intermediateConnector))
        XCTAssert(lines[4].contains("Leaf Depth Three"))
        
        XCTAssert(lines[5].contains(options.verticalLine))
        XCTAssert(lines[5].contains(options.finalConnector))
        XCTAssert(lines[5].contains("Branch Depth Two C"))
        
        XCTAssertFalse(lines[6].contains(options.verticalLine))
        XCTAssert(lines[6].contains(options.finalConnector))
        XCTAssert(lines[6].contains("Branch Depth One B"))
        
    }
    
    func testAlternateIntermediate() {
        let tree = TreeNode.sampleTree
        let options = CustomTreeFormatting(intermediateConnector: "*")
        let result = TreeFormatter.format(tree, options: options)
        print(result)
        let lines = result.split(separator: "\n")
        XCTAssertEqual(lines.count, 7)
        XCTAssertEqual(lines[0], "Root")
        
        XCTAssert(lines[1].starts(with: "*── "))
        XCTAssert(lines[1].contains("Branch Depth One A"))
        
        XCTAssert(lines[2].contains(options.verticalLine))
        XCTAssert(lines[2].contains(options.intermediateConnector))
        XCTAssert(lines[2].contains("Branch Depth Two A"))
        
        XCTAssert(lines[3].contains(options.verticalLine))
        XCTAssert(lines[3].contains(options.intermediateConnector))
        XCTAssert(lines[3].contains("Branch Depth Two B"))
        
        let regex = try! NSRegularExpression(pattern: options.verticalLine, options: .ignoreMetacharacters)
        
        XCTAssertEqual(2, regex.numberOfMatches(in: String(lines[4]), options: .withTransparentBounds, range: NSRange(lines[4].startIndex..., in: lines[4])))
        XCTAssert(lines[4].contains(options.finalConnector))
        XCTAssertFalse(lines[4].contains(options.intermediateConnector))
        XCTAssert(lines[4].contains("Leaf Depth Three"))
        
        XCTAssert(lines[5].contains(options.verticalLine))
        XCTAssert(lines[5].contains(options.finalConnector))
        XCTAssert(lines[5].contains("Branch Depth Two C"))
        
        XCTAssertFalse(lines[6].contains(options.verticalLine))
        XCTAssert(lines[6].contains(options.finalConnector))
        XCTAssert(lines[6].contains("Branch Depth One B"))
        
    }
    
    func testAlternateFinal() {
        let tree = TreeNode.sampleTree
        let options = CustomTreeFormatting(finalConnector: "\\")
        let result = TreeFormatter.format(tree, options: options)
        print(result)
        let lines = result.split(separator: "\n")
        XCTAssertEqual(lines.count, 7)
        XCTAssertEqual(lines[0], "Root")
        
        XCTAssert(lines[1].starts(with: "├── "))
        XCTAssert(lines[1].contains("Branch Depth One A"))
        
        XCTAssert(lines[2].contains(options.verticalLine))
        XCTAssert(lines[2].contains(options.intermediateConnector))
        XCTAssert(lines[2].contains("Branch Depth Two A"))
        
        XCTAssert(lines[3].contains(options.verticalLine))
        XCTAssert(lines[3].contains(options.intermediateConnector))
        XCTAssert(lines[3].contains("Branch Depth Two B"))
        
        let regex = try! NSRegularExpression(pattern: options.verticalLine, options: .ignoreMetacharacters)
        
        XCTAssertEqual(2, regex.numberOfMatches(in: String(lines[4]), options: .withTransparentBounds, range: NSRange(lines[4].startIndex..., in: lines[4])))
        XCTAssert(lines[4].contains(options.finalConnector))
        XCTAssertFalse(lines[4].contains(options.intermediateConnector))
        XCTAssert(lines[4].contains("Leaf Depth Three"))
        
        XCTAssert(lines[5].contains(options.verticalLine))
        XCTAssert(lines[5].contains(options.finalConnector))
        XCTAssert(lines[5].contains("Branch Depth Two C"))
        
        XCTAssertFalse(lines[6].contains(options.verticalLine))
        XCTAssert(lines[6].contains(options.finalConnector))
        XCTAssert(lines[6].contains("Branch Depth One B"))
        
    }
    
    func testAlternateSuffix() {
        let tree = TreeNode.sampleTree
        let options = CustomTreeFormatting(connectorSuffix: "~~")
        let result = TreeFormatter.format(tree, options: options)
        print(result)
        let lines = result.split(separator: "\n")
        XCTAssertEqual(lines.count, 7)
        XCTAssertEqual(lines[0], "Root")
        
        XCTAssert(lines[1].starts(with: "├~~"))
        XCTAssert(lines[1].contains("Branch Depth One A"))
        
        XCTAssert(lines[2].contains(options.verticalLine))
        XCTAssert(lines[2].contains(options.intermediateConnector))
        XCTAssert(lines[2].contains("Branch Depth Two A"))
        
        XCTAssert(lines[3].contains(options.verticalLine))
        XCTAssert(lines[3].contains(options.intermediateConnector))
        XCTAssert(lines[3].contains("Branch Depth Two B"))
        
        let regex = try! NSRegularExpression(pattern: options.verticalLine, options: .ignoreMetacharacters)
        
        XCTAssertEqual(2, regex.numberOfMatches(in: String(lines[4]), options: .withTransparentBounds, range: NSRange(lines[4].startIndex..., in: lines[4])))
        XCTAssert(lines[4].contains(options.finalConnector))
        XCTAssertFalse(lines[4].contains(options.intermediateConnector))
        XCTAssert(lines[4].contains("Leaf Depth Three"))
        
        XCTAssert(lines[5].contains(options.verticalLine))
        XCTAssert(lines[5].contains(options.finalConnector))
        XCTAssert(lines[5].contains("Branch Depth Two C"))
        
        XCTAssertFalse(lines[6].contains(options.verticalLine))
        XCTAssert(lines[6].contains(options.finalConnector))
        XCTAssert(lines[6].contains("Branch Depth One B"))
        
    }
    
    func testAlternateToTheMax() {
        let tree = TreeNode.sampleTree
        let options = CustomTreeFormatting(spacesPerDepth: 2,
                                           spacer: "SPC",
                                           verticalLine: "$",
                                           intermediateConnector: "*",
                                           finalConnector: "\\",
                                           connectorSuffix: "~~")
        let result = TreeFormatter.format(tree, options: options)
        print(result)
        
        let lines = result.split(separator: "\n")
        XCTAssertEqual(lines.count, 7)
        XCTAssertEqual(lines[0], "Root")
        
        XCTAssert(lines[1].starts(with: "*~~"))
        XCTAssert(lines[1].contains("Branch Depth One A"))
        
        XCTAssert(lines[2].contains(options.verticalLine))
        XCTAssert(lines[2].contains(options.intermediateConnector))
        XCTAssert(lines[2].contains("Branch Depth Two A"))
        
        XCTAssert(lines[3].contains(options.verticalLine))
        XCTAssert(lines[3].contains(options.intermediateConnector))
        XCTAssert(lines[3].contains("Branch Depth Two B"))
        
        let regex = try! NSRegularExpression(pattern: options.verticalLine,
                                             options: .ignoreMetacharacters)
        
        XCTAssertEqual(2, regex.numberOfMatches(in: String(lines[4]), options: .withTransparentBounds, range: NSRange(lines[4].startIndex..., in: lines[4])))
        XCTAssert(lines[4].contains(options.finalConnector))
        XCTAssertFalse(lines[4].contains(options.intermediateConnector))
        XCTAssert(lines[4].contains("Leaf Depth Three"))
        
        XCTAssert(lines[5].contains(options.verticalLine))
        XCTAssert(lines[5].contains(options.finalConnector))
        XCTAssert(lines[5].contains("Branch Depth Two C"))
        
        XCTAssertFalse(lines[6].contains(options.verticalLine))
        XCTAssert(lines[6].contains(options.finalConnector))
        XCTAssert(lines[6].contains("Branch Depth One B"))
        
    }
    
    func testOneItemAtDepthOne() {
        let options = CustomTreeFormatting()
        let result = TreeFormatter.format(TreeNode.sampleOneItemAtDepthZeroTree)
        print(result)
        let lines = result.split(separator: "\n")
        let line = lines[4]
        
        XCTAssertTrue(line.contains(options.verticalLine))
        
    }
    
    func testAlwaysPassingBootstrapper() {
        let options = CustomTreeFormatting(
            spacesPerDepth: 4,
            spacer: " ",
            verticalLine: "│",
            intermediateConnector: "├",
            finalConnector: "└",
            connectorSuffix: "── ")
        
        print(TreeFormatter.format(TreeNode.sampleTree, options: options))
        
    }
    
    func testOnlyOneFirstLevelNode() {
        let tree = TreeNode(title: "Root",
                            subNodes: [
                                TreeNode(title: "Level One", subNodes: [
                                    TreeNode(title: "Level Two A", subNodes: []),
                                    TreeNode(title: "Level Two B", subNodes: [])
                                ])
                            ])
        let result = TreeFormatter.format(tree)
        print(result)
        let lines = result.split(separator: "\n")
        
        XCTAssertFalse(lines[2].first == "│")
        
    }
    
    func testSeveralDepthsWithLeaves() {
        let options = CustomTreeFormatting()
        
        let tree = TreeNode(title: "Root", subNodes: [
            TreeNode(title: "Depth One A", subNodes: []),
            TreeNode(title: "Depth One B", subNodes: [
                TreeNode(title: "Depth Two A", subNodes: []),
                TreeNode(title: "Depth Two B", subNodes: []),
                TreeNode(title: "Depth Two C", subNodes: [
                    TreeNode(title: "Depth Three A", subNodes: [
                        TreeNode(title: "Depth Four A", subNodes: [])
                    ])
                ])
            ]),
            TreeNode(title: "Depth One C", subNodes: [
                TreeNode(title: "Depth Two D", subNodes: [
                    TreeNode(title: "Depth Three B", subNodes: [
                        TreeNode(title: "Depth Four B", subNodes: [
                            TreeNode(title: "Depth Five", subNodes: [])
                        ])
                    ]),
                    TreeNode(title: "Depth Three C", subNodes: [])
                ]),
                TreeNode(title: "Depth Two E", subNodes: [])
            ]),
            TreeNode(title: "Depth One D", subNodes: [])
        ])
        
        let result = TreeFormatter.format(tree, options: options)
        print(result)
        
        let lines = result.split(separator: "\n").map { String($0) }
        
        XCTAssertEqual(16, lines.count)
        // Root
        XCTAssertEqual(lines[0], tree.conciseDebugDescription)
        
        // Depth One A, Depth One B
        XCTAssertTrue(lines[1].starts(with: options.intermediateConnector))
        XCTAssertTrue(lines[2].starts(with: options.intermediateConnector))
        
        // Depth Two A
        XCTAssertTrue(lines[3].starts(with: options.verticalLine))
        XCTAssertTrue(lines[3].contains(options.intermediateConnector))
        
        // Depth Two B
        XCTAssertTrue(lines[4].starts(with: options.verticalLine))
        XCTAssertTrue(lines[4].contains(options.intermediateConnector))
        
        // Depth Two C
        XCTAssertTrue(lines[5].starts(with: options.verticalLine))
        XCTAssertTrue(lines[5].contains(options.finalConnector))
        
        // Depth Three A
        XCTAssertEqual(1, getMatchCount(options.verticalLine, in: lines[6]))
        XCTAssertTrue(lines[6].contains(options.finalConnector))
        
        // Depth Four A
        XCTAssertEqual(1, getMatchCount(options.verticalLine, in: lines[7]))
        XCTAssertTrue(lines[7].contains(options.finalConnector))
        
        // Depth One C
        XCTAssertTrue(lines[8].starts(with: options.intermediateConnector))
        
        // Depth Two D
        XCTAssertEqual(1, getMatchCount(options.verticalLine, in: lines[9]))
        XCTAssertTrue(lines[9].contains(options.intermediateConnector))
        
        // Depth Three B
        XCTAssertEqual(2, getMatchCount(options.verticalLine, in: lines[10]))
        XCTAssertTrue(lines[10].contains(options.intermediateConnector))
        
        // Depth Four B
        XCTAssertEqual(3, getMatchCount(options.verticalLine, in: lines[11]))
        XCTAssertTrue(lines[11].contains(options.finalConnector))
        
        // Depth Five
        XCTAssertEqual(3, getMatchCount(options.verticalLine, in: lines[12]))
        XCTAssertTrue(lines[12].contains(options.finalConnector))
        
        // Depth Three C
        XCTAssertEqual(2, getMatchCount(options.verticalLine, in: lines[13]))
        XCTAssertTrue(lines[13].contains(options.finalConnector))
        
        // Depth Two E
        XCTAssertEqual(1, getMatchCount(options.verticalLine, in: lines[14]))
        XCTAssertTrue(lines[14].contains(options.finalConnector))
        
        // Depth One D
        XCTAssertTrue(lines[15].starts(with: options.finalConnector))
        
    }
    
    func testWasMissingVerticalLine() {
        // Before bug fixes, the tree below was missing the
        // vertical line connecting "Depth Two B" and "Depth Two C".
        // (This is the line on the "Depth Three" row)
        // This test exercises Github issue #3.
        let tree = TreeNode(title: "Root", subNodes: [
            TreeNode(title: "Zero Depth", subNodes: [
                TreeNode(title: "Depth One", subNodes: [
                    TreeNode(title: "Depth Two A", subNodes: []),
                    TreeNode(title: "Depth Two B", subNodes: [
                        TreeNode(title: "Depth Three", subNodes: [])
                    ]),
                    TreeNode(title: "Depth Two C", subNodes: [])
                ])
            ]),
            TreeNode(title: "Zero Depth Again", subNodes: [])
        ])
        
        let options = CustomTreeFormatting()
        let result = TreeFormatter.format(tree, options: options)
        let lines = result.split(separator: "\n").map { String($0) }
        
        print(result)
        
        XCTAssertEqual(8, lines.count)
        // Root
        XCTAssertEqual("Root", lines[0])
        
        // Zero Depth
        XCTAssertTrue(lines[1].starts(with: options.intermediateConnector))
        
        // Depth One
        XCTAssertEqual(1, getMatchCount(options.verticalLine, in: lines[2]))
        XCTAssertEqual(1, getMatchCount(options.finalConnector, in: lines[2]))
        
        // Depth Two A
        XCTAssertEqual(1, getMatchCount(options.verticalLine, in: lines[3]))
        XCTAssertEqual(1, getMatchCount(options.intermediateConnector, in: lines[3]))
        
        // Depth Two B
        XCTAssertEqual(1, getMatchCount(options.verticalLine, in: lines[4]))
        XCTAssertEqual(1, getMatchCount(options.intermediateConnector, in: lines[4]))
        
        // Depth Three
        XCTAssertEqual(2, getMatchCount(options.verticalLine, in: lines[5]))
        XCTAssertEqual(1, getMatchCount(options.finalConnector, in: lines[5]))
        
        // Depth Two C
        XCTAssertEqual(1, getMatchCount(options.verticalLine, in: lines[6]))
        XCTAssertEqual(1, getMatchCount(options.finalConnector, in: lines[6]))
        
        // Zero Depth Again
        XCTAssertEqual(1, getMatchCount(options.finalConnector, in: lines[7]))
        XCTAssert(lines[7].starts(with: options.finalConnector))
        
    }
    
    private func getMatchCount(_ pattern: String, in haystack: String) -> Int {
        let regex = try! NSRegularExpression(pattern: pattern,
                                             options: .ignoreMetacharacters)
        
        return regex.numberOfMatches(in: haystack,
                                     options: .withTransparentBounds,
                                     range: NSRange(haystack.startIndex..., in: haystack))
    }
    
}
