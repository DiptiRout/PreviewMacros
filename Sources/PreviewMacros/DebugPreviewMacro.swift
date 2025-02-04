//
//  DebugPreviewMacro.swift
//  PreviewMacros
//
//  Created by Diptiranjan Rout on 04/02/25.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

/// Define the `DebugPreview` Macro
public struct DebugPreviewMacro: ExpressionMacro {
    public static func expansion(
        of node: MacroExpansionExprSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        // Generate the appropriate Swift code for the debug preview.
        let previewCode = """
        #if DEBUG
        #Preview \(node.argumentList)
        #endif
        """
        
        // Wrap the string inside ExprSyntax to return a valid expression.
        return try ExprSyntax(previewCode)
    }
}

/// Register the Macro Plugin
@main
struct PreviewMacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [DebugPreviewMacro.self]
}
