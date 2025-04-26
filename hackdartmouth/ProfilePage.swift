import SwiftUI

struct ProfilePage: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Student Name")
                    .font(.title2)
                    .bold()
                Text("Major: Computer Science")
                Text("University: Dartmouth College")
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}
