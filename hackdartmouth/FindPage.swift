import SwiftUI

struct FindPage: View {
    let students = ["Alice", "Bob", "Charlie", "Dana"]

    var body: some View {
        NavigationView {
            List(students, id: \.self) { student in
                HStack {
                    Text(student)
                    Spacer()
                    Button("Invite") {
                        
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Find Study Partners")
        }
    }
}

