import SwiftUI

struct HomePage: View {
    @State private var selectedSubject = ""
    let subjects = ["Math", "Physics", "Computer Science", "History", "Biology"]

    var body: some View {
        NavigationView {
            List(subjects, id: \.self) { subject in
                Button(subject) {
                    selectedSubject = subject
                    // Handle subject selection if needed
                }
            }
            .navigationTitle("Choose a Subject")
        }
    }
}
