import SwiftUI

struct InvitesPage: View {
    @State private var invites = ["Invite from Alice", "Invite from Charlie"]

    var body: some View {
        NavigationView {
            List(invites, id: \.self) { invite in
                HStack {
                    Text(invite)
                    Spacer()
                    Button("Accept") {
                        
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Invites")
        }
    }
}

