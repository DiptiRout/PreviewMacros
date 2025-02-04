//
//  DebugPreviewMacro.swift
//  PreviewMacros
//
//  Created by Diptiranjan Rout on 04/02/25.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Define the `DebugPreview` Macro
public struct DebugPreviewMacro: ExpressionMacro {
    public static func expansion(
        of node: MacroExpansionExprSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        return """
        #if DEBUG
        #Preview \(node.argumentList)
        #endif
        """
    }
}

/// Register the Macro Plugin
@main
struct PreviewMacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [DebugPreviewMacro.self]
}
