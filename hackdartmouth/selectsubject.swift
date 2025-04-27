import SwiftUI

struct SelectSubjectPage: View {
    @EnvironmentObject var userSession: UserSession
    @State private var subjectText: String = ""
    @State private var navigateToMain = false

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
                    // 🚀 This will now take you to MainTabView
                    userSession.study = subjectText
                    userSession.hasSelectedSubject = true
                    navigateToMain = true
                }) {
                    Text("Look for Study Groups")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                
            }
            .padding(.horizontal)

            Spacer()

            // Hidden NavigationLink
            NavigationLink(destination: MainTabView(), isActive: $navigateToMain)
            {
                EmptyView()
            }
        }
        .background(Color.black.ignoresSafeArea())
    }

    // Hide Keyboard when pressing return
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
