import SwiftUI

struct StudyGroup: Identifiable {
    var id = UUID()
    var subject: String
    var currentMembers: Int
    var location: String
    var isJoined: Bool = false   // Track if the user has joined
}

struct HomePage: View {
    @State private var studyGroups: [StudyGroup] = [
        StudyGroup(subject: "Calculus", currentMembers: 3, location: "Snell Library"),
        StudyGroup(subject: "Chemistry", currentMembers: 2, location: "Science Building Room 204"),
        StudyGroup(subject: "Computer Science", currentMembers: 5, location: "ISEC"),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach($studyGroups) { $group in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(group.subject)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            HStack {
                                Label("\(group.currentMembers) people", systemImage: "person.3.fill")
                                Label(group.location, systemImage: "mappin.and.ellipse")
                            }
                            .foregroundColor(.white.opacity(0.7))
                            .font(.subheadline)
                            
                            Button(action: {
                                group.isJoined = true
                            }) {
                                Text(group.isJoined ? "Joined" : "Join Group")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(group.isJoined ? Color.gray : Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .disabled(group.isJoined)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Find Study Groups")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

