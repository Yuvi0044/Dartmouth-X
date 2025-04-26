import Foundation

struct StudySession: Identifiable, Hashable {
    let id = UUID()
    var subject: String
    var hostName: String
    var time: String
    var attendees: [String] // list of students who joined
}


