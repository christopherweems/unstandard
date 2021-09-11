//  CustomTreeFormatting.swift
//  9/11/21

import Foundation

public struct CustomTreeFormatting {
    let spacesPerDepth: Int
    let spacer: String
    let verticalLine: String
    let intermediateConnector: String
    let finalConnector: String
    let connectorSuffix: String
    
    public init(spacesPerDepth: Int = 4,
                spacer: String = " ",
                verticalLine: String = "│",
                intermediateConnector: String = "├",
                finalConnector: String = "└",
                connectorSuffix: String = "── ") {
        self.spacesPerDepth = spacesPerDepth
        self.spacer = spacer
        self.verticalLine = verticalLine
        self.intermediateConnector = intermediateConnector
        self.finalConnector = finalConnector
        self.connectorSuffix = connectorSuffix
        
    }
    
}

extension CustomTreeFormatting {
    public static let alternateDefaults: Self = {
        .init(spacesPerDepth: 5,
              spacer: " ",
              verticalLine: "|",
              intermediateConnector: "+",
              finalConnector: "`",
              connectorSuffix: "-- ")
    }()
    
}
