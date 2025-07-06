import SwiftUI

struct DateWidget: TerminalWidget {
    let id = "date"
    let label = "DATE"
    let title = "📅"
    @State private var currentDate = ""
    @State var isLoading = false
    
    var value: String { 
        if currentDate.isEmpty {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd"
            return formatter.string(from: Date())
        }
        return currentDate 
    }
    
    var body: some View {
        TerminalWidgetRow(widget: self)
            .onAppear {
                updateDate()
            }
            .onReceive(Timer.publish(every: 60.0, on: .main, in: .common).autoconnect()) { _ in
                updateDate()
            }
    }
    
    private func updateDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        currentDate = formatter.string(from: Date())
    }
    
    func refresh() async {
        updateDate()
    }
}