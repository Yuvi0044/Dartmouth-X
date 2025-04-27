import Foundation

class UserSession: ObservableObject {
    @Published var isLoggedIn = false
    @Published var hasSelectedSubject = false
    @Published var email = ""
    @Published var name = ""
    @Published var university = ""
    @Published var phoneNumber = ""
    @Published var study = ""

    @Published var confirmedSessions: [String] = []   // for HomePage
    @Published var myCreatedSessions: [String] = []   // for InvitesPage
    @Published var availableSessions: [String] = []   // for FindPage
}
