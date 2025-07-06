import SwiftUI

struct StatusWidget: TerminalWidget {
    let id = "status"
    let label = "STAT"
    let title = "⚙️"
    @State private var statusMessage = ""
    @State var isLoading = false
    
    var value: String { statusMessage }
    
    var body: some View {
        TerminalWidgetRow(widget: self)
            .onAppear {
                updateStatus()
                Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
                    updateStatus()
                }
            }
    }
    
    private func updateStatus() {
        let messages = [
            "online",
            "active",
            "ready",
            "OK",
            "running"
        ]
        statusMessage = messages.randomElement() ?? "ok"
    }
    
    func refresh() async {
        updateStatus()
    }
}