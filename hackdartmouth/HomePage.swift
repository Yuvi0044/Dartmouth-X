import SwiftUI

struct HomePage: View {
    @EnvironmentObject var userSession: UserSession
    @State private var studyEvents: [StudyEvent] = []
    @State private var pressedListingIndex: Int? = nil

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("View Listings")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding(.top, 40)

                    Spacer()

                    Button(action: {
                        fetchStudyEvents()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.title2)
                            .padding(10)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(color: Color.orange.opacity(0.4), radius: 8, x: 0, y: 4)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 40)

                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(studyEvents.indices, id: \.self) { index in
                            let event = studyEvents[index]
                            VStack(alignment: .leading, spacing: 8) {
                                Text(event.name)
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(.black)

                                Text("Chapter: \(event.chapter ?? "N/A")")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)

                                Text("Duration: \(event.duration ?? "N/A")")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)

                                Text("Start Time: \(event.startTime ?? "N/A")")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)

                                Button(action: {
                                    acceptEvent(at: index)
                                }) {
                                    Text(event.isAccepted ? "Accepted" : "Accept")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(event.isAccepted ? Color.green : Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding(.top, 10)
                                .disabled(event.isAccepted) // Disable button after accept
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(pressedListingIndex == index ? Color.gray.opacity(0.3) : Color.white)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 6)
                            .padding(.horizontal)
                            .onTapGesture {
                                pressedListingIndex = index
                            }
                        }
                    }
                    .padding(.top, 10)
                }

                Spacer()
            }
            .background(Color(red: 249/255, blue: 244/255, blue: 233/255))
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
        .onAppear {
            fetchStudyEvents()
        }
    }

    func fetchStudyEvents() {
        guard let url = URL(string: "https://able-only-chamois.ngrok-free.app/view_study_events?email=\(userSession.email)&topic=\(userSession.study)") else {
            print("❌ Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ Network error: \(error.localizedDescription)")
                    return
                }

                guard let data = data else {
                    print("❌ No data received")
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let events = try decoder.decode([StudyEvent].self, from: data)
                    studyEvents = events
                    print("✅ Successfully decoded study events")
                } catch {
                    print("❌ Failed to decode: \(error.localizedDescription)")
                }
            }
        }.resume()
    }

    func acceptEvent(at index: Int) {
        studyEvents[index].isAccepted = true
        print("✅ Accepted event: \(studyEvents[index].name)")
    }
}

