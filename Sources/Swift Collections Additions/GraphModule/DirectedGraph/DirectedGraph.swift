//
//  DirectedGraph.swift
//  
//
//  Created by Christopher Weems on 11/11/21.
//

public enum Directed: GraphConstraint { }


// MARK: -

public typealias DirectedGraph<Vertex, Edge> = Graph<Directed, Vertex, Edge>
where Vertex : Hashable, Edge : Hashable


// MARK: -

extension DirectedGraph {
    public mutating func insert(vertex: Vertex, edge: Edge, following preceedingVertex: Vertex) {
        let preceedingNode = nodes[preceedingVertex]
        precondition(preceedingNode != nil)
        
        if let existingNode = nodes[vertex] {
            preceedingNode!.followingEdges.append((edge, existingNode))
            
        } else {
            nodes[vertex] = VertexNode(vertex: vertex, edge: edge, following: preceedingNode)
            
        }
    }
    
}

extension DirectedGraph where Vertex == String {
    public mutating func insert<V>(vertex: V, edge: Edge, following preceedingVertex: V) where V : StringProtocol {
        self.insert(vertex: String(vertex), edge: edge, following: String(preceedingVertex))
    }
    
}


// MARK: -

extension DirectedGraph {
    public func vertices(after preceedingVertex: Vertex) -> [(Edge, Vertex)] {
        guard let preceedingVertexNode = nodes[preceedingVertex] else { return [] }
        return preceedingVertexNode.followingEdges.map { ($0, $1.vertex) }
    }
    
}

extension DirectedGraph where Vertex == String {
    public func vertices<SP>(after preceedingVertex: SP) -> [(Edge, Vertex)] where SP : StringProtocol {
        self.vertices(after: Vertex(preceedingVertex))
    }
    
}
