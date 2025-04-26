import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            if isLoggedIn {
                MainTabView()
            } else {
                LoginPage(isLoggedIn: $isLoggedIn)

            }
        }
        .preferredColorScheme(.dark)
    }
}
