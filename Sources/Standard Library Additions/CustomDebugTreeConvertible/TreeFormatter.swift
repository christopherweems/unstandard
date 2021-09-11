//  TreeFormatter.swift
//  9/11/21
//  Adapted from https://github.com/cliss/TreePrinter [Package is MIT Licensed]

internal class TreeFormatter {
    /// Creates a `String` representation of a tree structure.
    /// - Parameters:
    ///   - root: Root of the tree; must conform to `TreeReprsentable`
    ///   - options: Optional set of options to configure how the output looks
    internal static func format<Node>(_ rootNode: Node, options: CustomTreeFormatting = .init()) -> String
        where Node: CustomDebugTreeConvertible {
        return printNode(node: rootNode,
                         depth: 0,
                         depthsFinished: Set(),
                         options: options)
    }
    
}


// 

extension TreeFormatter {
    /// Recursive function to print a node and all subnodes.
    /// - Parameters:
    ///   - node: Node to print
    ///   - depth: Current depth of the tree
    ///   - depthsFinished: `Set` of depths that are complete
    ///   - options: Options to use to configure output
    private static func printNode<Node>(node: Node,
                                        depth: Int,
                                        depthsFinished: Set<Int>,
                                        options: CustomTreeFormatting) -> String where Node: CustomDebugTreeConvertible {
        var retVal = ""
        
        // Prefix the appropriate spaces/pipes.
        for i in 0..<max(depth - 1, 0) * options.spacesPerDepth {
            if i % options.spacesPerDepth == 0 && !depthsFinished.contains(i / options.spacesPerDepth + 1) {
                retVal += options.verticalLine
                
            } else {
                retVal += options.spacer
                
            }
            
        }
        
        // Now the correct connector: either an intermediate or a final
        if depth > 0 {
            if depthsFinished.contains(depth) {
                retVal += options.finalConnector
                
            } else {
                retVal += options.intermediateConnector
                
            }
            
            // Connector suffix
            retVal += options.connectorSuffix
            
        }
        
        // Name
        retVal += node.conciseDebugDescription
        
        // Newline to prepare for either sub-tree or next peer
        retVal += "\n"
        
        // Sub-tree
        for (index, subnode) in node.debugTreeSubnodes.enumerated() {
            var newDepthsFinished = depthsFinished
            
            // There can only be one root node, so if it isn't marked, mark it.
            if depth == 0 {
                newDepthsFinished.insert(depth)
                
            }
            
            // If we're the last subnode, mark that depth as finished.
            if index == node.debugTreeSubnodes.count - 1 {
                newDepthsFinished.insert(depth + 1)
                
            }
            
            retVal += printNode(node: subnode,
                                depth: depth + 1,
                                depthsFinished: newDepthsFinished,
                                options: options)
            
        }
        
        return retVal
    }
    
}
