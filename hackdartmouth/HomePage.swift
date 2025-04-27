import SwiftUI

struct HomePage: View {
    @EnvironmentObject var userSession: UserSession
<<<<<<< HEAD
    @State private var studyEvents: [StudyEvent] = []
    @State private var pressedListingIndex: Int? = nil
=======
    @State private var studyEvents: [[String: Any]] = []
    @State private var showRequestInvite = false
    @State private var selectedListing = ""
    @State private var isLoading = false
>>>>>>> 7a6042dc20e731dbe9f7fce305c6e54855024eec

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("View Listings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 40)

                    Spacer()

<<<<<<< HEAD
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
=======
                    // ❌ No manual refresh button anymore (we discussed)
>>>>>>> 7a6042dc20e731dbe9f7fce305c6e54855024eec
                }
                .padding(.horizontal)
                .padding(.top, 40)

<<<<<<< HEAD
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
=======
                if isLoading {
                    Spacer()
                    ProgressView()
                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(Array(studyEvents.enumerated()), id: \.offset) { index, event in
                                Button(action: {
                                    selectedListing = event["name"] as? String ?? "Unknown"
                                    showRequestInvite = true
                                }) {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text(event["name"] as? String ?? "No Name")
                                            .font(.headline)
                                            .foregroundColor(.black)

                                        Text("Chapter: \(event["chapter"] as? String ?? "N/A")")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)

                                        Text("Duration: \(event["duration"] as? String ?? "N/A")")
                                            .font(.caption)
                                            .foregroundColor(.gray)

                                        Text("Start Time: \(event["startTime"] as? String ?? "N/A")")
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .shadow(radius: 3)
                                    .padding(.horizontal)
                                }
>>>>>>> 7a6042dc20e731dbe9f7fce305c6e54855024eec
                            }
                        }
                        .padding(.top, 10)
                    }
                }
            }
            .background(Color(red: 249/255, blue: 244/255, blue: 233/255))
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
        .onAppear {
            fetchStudyEvents()
<<<<<<< HEAD
=======
        }
        .alert(isPresented: $showRequestInvite) {
            Alert(
                title: Text("Request Invite"),
                message: Text("Do you want to request an invite for \(selectedListing)?"),
                primaryButton: .default(Text("Yes")),
                secondaryButton: .cancel(Text("No"))
            )
>>>>>>> 7a6042dc20e731dbe9f7fce305c6e54855024eec
        }
    }

    func fetchStudyEvents() {
<<<<<<< HEAD
        guard let url = URL(string: "https://able-only-chamois.ngrok-free.app/view_study_events?email=\(userSession.email)&topic=\(userSession.study)") else {
=======
        guard var components = URLComponents(string: "https://able-only-chamois.ngrok-free.app/view_study_events") else {
>>>>>>> 7a6042dc20e731dbe9f7fce305c6e54855024eec
            print("❌ Invalid URL")
            return
        }

<<<<<<< HEAD
=======
        components.queryItems = [
            URLQueryItem(name: "email", value: userSession.email),
            URLQueryItem(name: "topic", value: userSession.study)
        ]

        guard let url = components.url else {
            print("❌ Failed to construct URL with parameters")
            return
        }

        isLoading = true
        studyEvents = []

>>>>>>> 7a6042dc20e731dbe9f7fce305c6e54855024eec
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
<<<<<<< HEAD
=======
                isLoading = false

>>>>>>> 7a6042dc20e731dbe9f7fce305c6e54855024eec
                if let error = error {
                    print("❌ Network error: \(error.localizedDescription)")
                    return
                }

                guard let data = data else {
                    print("❌ No data received")
                    return
                }

                do {
<<<<<<< HEAD
                    let decoder = JSONDecoder()
                    let events = try decoder.decode([StudyEvent].self, from: data)
                    studyEvents = events
                    print("✅ Successfully decoded study events")
                } catch {
                    print("❌ Failed to decode: \(error.localizedDescription)")
=======
                    if let array = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        studyEvents = array
                        print("✅ Successfully parsed study events")
                        
                        // Optional: print each event
                        for event in studyEvents {
                            print("📦 Event: \(event)")
                        }
                    } else {
                        print("❌ Server did not return an array")
                    }
                } catch {
                    print("❌ Failed to parse JSON: \(error.localizedDescription)")
>>>>>>> 7a6042dc20e731dbe9f7fce305c6e54855024eec
                }
            }
        }.resume()
    }
<<<<<<< HEAD

    func acceptEvent(at index: Int) {
        studyEvents[index].isAccepted = true
        print("✅ Accepted event: \(studyEvents[index].name)")
    }
=======
>>>>>>> 7a6042dc20e731dbe9f7fce305c6e54855024eec
}

