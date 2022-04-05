//
//  DirectedGraph.swift
//  
//
//  Created by Christopher Weems on 11/10/21.
//

import Foundation

public struct Graph<Constraint, Vertex, Edge> where Constraint: GraphConstraint, Vertex : Hashable {
    internal var nodes: [Vertex: VertexNode]
    
    public init<V>(vertices: V) where V : Collection, V.Element == Vertex {
        let dictionaryValues = vertices.map { ($0, VertexNode(vertex: $0)) }
        self.nodes = Dictionary(uniqueKeysWithValues: dictionaryValues)
        
    }
    
    public init() {
        self.init(vertices: Array())
        
    }
    
}


// MARK: - Insertion

extension Graph {
    public mutating func insert(vertex: Vertex) {
        assert(nodes[vertex] == nil)
        nodes[vertex] = VertexNode(vertex: vertex)
    }
    
}




// MARK: -

extension Graph {
    public func firstVertex(where predicate: (Vertex) -> Bool) -> Vertex? {
        nodes.first(where: { predicate($0.key) })?.key
    }
    
    public func vertices(where predicate: (Vertex) -> Bool) -> [Vertex] {
        nodes.keys.filter(predicate)
    }
    
    public func contains(vertex: Vertex) -> Bool {
        nodes[vertex] != nil
    }
    
}

