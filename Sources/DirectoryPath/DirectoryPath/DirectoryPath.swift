import SystemPackage

public struct DirectoryPath: FilePathProtocol {
    private var directoryFilePath: FilePath
    
    public var filePath: FilePath {
        directoryFilePath
    }
    
    public var stem: String? {
        directoryFilePath.stem
    }
    
    
    // MARK: - Initializers
    
    public init(_ path: FilePath) {
        directoryFilePath = path
        
    }
    
    public init(_ path: Self) {
        self = path
        
    }
    
    public init(_ string: String) {
        directoryFilePath = .init(string)
        
    }
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
        
    }
    
}

extension DirectoryPath {
    public var string: String {
        directoryFilePath.string + "/"
    }
    
    public var description: String {
        let filePathDescription = directoryFilePath.description
        assert(filePathDescription.hasSuffix("/") == false)
        return filePathDescription + "/"
    }
    
    public var debugDescription: String {
        let filePathDescription = directoryFilePath.debugDescription
        assert(filePathDescription.hasSuffix("/") == false)
        return filePathDescription + "/"
    }
    
}

extension DirectoryPath {
    public func appending<Result>(_ other: String, resultType: Result.Type = Result.self) -> Result where Result : FilePathProtocol {
        var intermediate = directoryFilePath
        intermediate.append(other)
        return Result(intermediate)
    }
    
    public func appending<Result>(_ other: Component, resultType: Result.Type = Result.self) -> Result where Result : FilePathProtocol {
        var intermediate = directoryFilePath
        intermediate.append(other)
        return Result(intermediate)
    }
    
    public func pushing(_ other: __owned FilePath) -> FilePath {
        directoryFilePath.pushing(other)
    }
    
    public mutating func removePrefix<Prefix>(_ prefix: Prefix) -> Bool where Prefix : FilePathProtocol {
        self.directoryFilePath.removePrefix(prefix)
    }
    
}
