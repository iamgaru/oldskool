import SwiftUI

struct TerminalTheme {
    static let backgroundColor = Color.black
    static let primaryTextColor = Color.green
    static let secondaryTextColor = Color.green.opacity(0.7)
    static let accentColor = Color.yellow
    static let errorColor = Color.red
    
    static let promptText = ">"
    
    static let primaryFont = Font.system(.caption, design: .monospaced, weight: .regular)
    static let titleFont = Font.system(.caption2, design: .monospaced, weight: .bold)
    static let smallFont = Font.system(.caption2, design: .monospaced, weight: .regular)
    
    static let lineSpacing: CGFloat = 1
    static let sectionSpacing: CGFloat = 2
}