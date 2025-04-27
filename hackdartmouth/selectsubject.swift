import SwiftUI

struct SelectSubjectPage: View {
    @EnvironmentObject var userSession: UserSession
    @State private var subjectText: String = ""
    @State private var navigateToMain = false
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 40) {
            Spacer()

            Text("You have 24 hours to make a move and match with a group!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 8) {
                TextField("Enter your subject...", text: $subjectText)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                    .background(Color.clear)
                    .submitLabel(.done)
                    .onSubmit {
                        hideKeyboard()
                    }

                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)

            VStack(spacing: 20) {
                Button(action: {
                    findStudyGroups()
                }) {
                    Text("Look for Study Groups")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
            }
            .padding(.horizontal)

            Spacer()

            NavigationLink(destination: MainTabView(), isActive: $navigateToMain) {
                EmptyView()
            }
        }
        .background(Color.black.ignoresSafeArea())
    }

    // Hide Keyboard when pressing return
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    // API CALL
    func findStudyGroups() {
        guard var components = URLComponents(string: "https://able-only-chamois.ngrok-free.app/view_study_events") else {
            errorMessage = "Invalid URL."
            return
        }

        components.queryItems = [
            URLQueryItem(name: "email", value: userSession.email),
            URLQueryItem(name: "topic", value: subjectText)
        ]

        guard let url = components.url else {
            errorMessage = "Failed to create request URL."
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    errorMessage = "Network error: \(error.localizedDescription)"
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    errorMessage = "Invalid server response."
                    return
                }

                if httpResponse.statusCode == 200 {
                    // ✅ Success
                    userSession.study = subjectText
                    userSession.hasSelectedSubject = true
                    navigateToMain = true
                } else {
                    errorMessage = "Failed to find study groups. (Status code: \(httpResponse.statusCode))"
                }
            }
        }.resume()
    }
}

