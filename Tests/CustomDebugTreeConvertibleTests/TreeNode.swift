// Tests from https://github.com/cliss/TreePrinter

import CustomDebugTreeConvertible

struct TreeNode {
    let title: String
    let subNodes: [TreeNode]
    
}

extension TreeNode {
    static var sampleTree: TreeNode {
        let depthThree = TreeNode(title: "Leaf Depth Three", subNodes: [])
        
        let depthTwoA = TreeNode(title: "Branch Depth Two A", subNodes: [])
        let depthTwoB = TreeNode(title: "Branch Depth Two B", subNodes: [depthThree])
        let depthTwoC = TreeNode(title: "Branch Depth Two C", subNodes: [])
        
        let depthOneA = TreeNode(title: "Branch Depth One A", subNodes: [depthTwoA, depthTwoB, depthTwoC])
        let depthOneB = TreeNode(title: "Branch Depth One B", subNodes: [])
        
        let root = TreeNode(title: "Root", subNodes: [depthOneA, depthOneB])
        
        return root
    }
    
    static var sampleOneItemAtDepthZeroTree: TreeNode {
        return TreeNode(title: "Zero Depth", subNodes: [
            TreeNode(title: "Depth One", subNodes: [
                TreeNode(title: "Depth Two A", subNodes: []),
                TreeNode(title: "Depth Two B", subNodes: [
                    TreeNode(title: "Depth Three", subNodes: [])
                ]),
                TreeNode(title: "Depth Two C", subNodes: [])
            ])
        ])
    }
    
}

extension TreeNode: CustomDebugTreeConvertible {
    var conciseDebugDescription: String { self.title }
    var debugTreeSubnodes: [TreeNode] { self.subNodes }
    
}
