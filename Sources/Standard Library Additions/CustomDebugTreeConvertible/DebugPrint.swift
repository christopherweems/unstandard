//  DebugPrint.swift
//  9/11/21

public func debugPrint<T>(tree: T, options: CustomTreeFormatting = .init()) where T : CustomDebugTreeConvertible {
    print(TreeFormatter.format(tree, options: options))
}
