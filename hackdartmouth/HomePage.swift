import SwiftUI

struct HomePage: View {
    @EnvironmentObject var userSession: UserSession
    @State private var studyEvents: [[String: Any]] = []
    @State private var showRequestInvite = false
    @State private var selectedListing = ""
    @State private var isLoading = false

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

                    // ❌ No manual refresh button anymore (we discussed)
                }
                .padding(.horizontal)
                .padding(.top, 40)

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
                            }
                        }
                        .padding(.top, 10)
                    }
                }
            }
            .background(Color(red: 249/255, green: 244/255, blue: 233/255))
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
        .onAppear {
            fetchStudyEvents()
        }
        .alert(isPresented: $showRequestInvite) {
            Alert(
                title: Text("Request Invite"),
                message: Text("Do you want to request an invite for \(selectedListing)?"),
                primaryButton: .default(Text("Yes")),
                secondaryButton: .cancel(Text("No"))
            )
        }
    }

    func fetchStudyEvents() {
        guard var components = URLComponents(string: "https://able-only-chamois.ngrok-free.app/view_study_events") else {
            print("❌ Invalid URL")
            return
        }

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

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false

                if let error = error {
                    print("❌ Network error: \(error.localizedDescription)")
                    return
                }

                guard let data = data else {
                    print("❌ No data received")
                    return
                }

                do {
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
                }
            }
        }.resume()
    }
}

