import Foundation

class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var university: String = ""
    @Published var phoneNumber: String = ""
    @Published var study: String = ""
    
    var hasSelectedSubject: Bool {
        return !study.isEmpty
    }
}

