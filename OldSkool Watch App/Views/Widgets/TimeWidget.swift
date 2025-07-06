import SwiftUI

struct TimeWidget: TerminalWidget {
    let id = "time"
    let label = "TIME"
    let title = "🕰️"
    @State private var currentTime = ""
    @State var isLoading = false
    
    var value: String { 
        if currentTime.isEmpty {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            formatter.dateStyle = .none
            return formatter.string(from: Date())
        }
        return currentTime 
    }
    
    var body: some View {
        TerminalWidgetRow(widget: self)
            .onAppear {
                updateTime()
            }
            .onReceive(Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()) { _ in
                updateTime()
            }
    }
    
    private func updateTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        currentTime = formatter.string(from: Date())
    }
    
    func refresh() async {
        updateTime()
    }
}