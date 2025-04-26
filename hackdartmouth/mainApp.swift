import SwiftUI

@main
struct StudyBuddyApp: App {
    @StateObject var userSession = UserSession()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environmentObject(userSession)
            }
        }
    }
}

