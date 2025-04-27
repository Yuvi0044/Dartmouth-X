import Foundation

struct StudyEvent: Codable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var chapter: String?
    var duration: String?
    var startTime: String?

    var isAccepted: Bool = false

    private enum CodingKeys: String, CodingKey {
        case name, chapter, duration, startTime
    }
}

