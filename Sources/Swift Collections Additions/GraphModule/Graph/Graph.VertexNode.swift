//
//  DirectedGraph.VertexNode.swift
//  
//
//  Created by Christopher Weems on 11/10/21.
//

import Foundation
import Resultto

extension Graph {
    internal class VertexNode {
        let vertex: Vertex
        let preceedingNode: VertexNode?
        
        var followingEdges: [(Edge, VertexNode)]
        
        init(vertex: Vertex) {
            self.vertex = vertex
            self.preceedingNode = nil
            self.followingEdges = []
            
        }
        
        init(vertex: Vertex, edge: Edge, following preceedingNode: VertexNode? = nil) {
            precondition(vertex != preceedingNode?.vertex)
            
            self.vertex = vertex
            self.preceedingNode = preceedingNode
            self.followingEdges = []
            
            preceedingNode?.followingEdges.append((edge, self))
            
        }
    }
    
}

extension Graph.VertexNode: Hashable, Equatable where Edge : Hashable & Equatable {
    @AllTrue
    static func ==(lhs: Graph.VertexNode, rhs: Graph.VertexNode) -> Bool {
        lhs.vertex == rhs.vertex
        lhs.preceedingNode == rhs.preceedingNode
        
        if lhs.followingEdges.count == rhs.followingEdges.count {
            zip(lhs.followingEdges, rhs.followingEdges).allSatisfy {
                $0.0 == $1.0 && $0.1 == $1.1
            }
            
        } else {
            false
            
        }
        
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(vertex)
        hasher.combine(preceedingNode?.vertex)
        
        followingEdges.forEach {
            hasher.combine($0.0)
            hasher.combine($0.1)
            
        }
        
    }
    
}
