import SwiftUI

protocol TerminalWidget: View {
    var id: String { get }
    var label: String { get }
    var title: String { get }
    var value: String { get }
    var isLoading: Bool { get }
    
    func refresh() async
}

struct TerminalWidgetRow: View {
    let widget: any TerminalWidget
    
    var body: some View {
        HStack(spacing: 1) {
            Text(TerminalTheme.promptText)
                .font(TerminalTheme.primaryFont)
                .foregroundColor(TerminalTheme.primaryTextColor)
            
            Text(widget.label)
                .font(TerminalTheme.primaryFont)
                .foregroundColor(TerminalTheme.primaryTextColor)
                .frame(width: 32, alignment: .leading)
            
            Text(widget.title)
                .font(TerminalTheme.primaryFont)
                .foregroundColor(TerminalTheme.primaryTextColor)
            
            if widget.isLoading {
                Text("...")
                    .font(TerminalTheme.primaryFont)
                    .foregroundColor(TerminalTheme.secondaryTextColor)
            } else {
                Text(widget.value)
                    .font(TerminalTheme.primaryFont)
                    .foregroundColor(TerminalTheme.accentColor)
            }
        }
        .lineLimit(1)
        .minimumScaleFactor(0.4)
    }
}