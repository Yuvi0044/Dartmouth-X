import SwiftUI

struct ContentView: View {
    @StateObject private var userSession = UserSession()

    var body: some View {
        NavigationStack {
            if userSession.isLoggedIn {
                if userSession.hasSelectedSubject {
                    MainTabView()
                        .environmentObject(userSession)
                } else {
                    SelectSubjectPage()
                        .environmentObject(userSession)
                }
            } else {
                LoginPage()
                    .environmentObject(userSession)
            }
        }
        .preferredColorScheme(.dark)
    }
}

