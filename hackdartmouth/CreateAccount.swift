import SwiftUI

struct CreateAccountPage: View {
    @EnvironmentObject var userSession: UserSession

    @State private var email = ""
    @State private var name = ""
    @State private var university = ""
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var study = ""

    @State private var signupError = ""
    @State private var showSelectSubject = false

    var body: some View {
        if showSelectSubject {
            // ✅ When account created, permanently move to SelectSubjectPage
            SelectSubjectPage()
                .environmentObject(userSession)
        } else {
            VStack(spacing: 20) {
                Spacer()

                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                VStack(spacing: 15) {
                    TextField("University Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)

                    TextField("Full Name", text: $name)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)

                    TextField("University Name", text: $university)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)

                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)

                    TextField("What are you studying?", text: $study)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                Button("Submit") {
                    createAccount()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)

                if !signupError.isEmpty {
                    Text(signupError)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .background(Color.black.ignoresSafeArea())
            .preferredColorScheme(.dark)
        }
    }

    func createAccount() {
        // 🛠 (simulate API success response)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            userSession.email = email
            userSession.name = name
            userSession.university = university
            userSession.phoneNumber = phoneNumber
            userSession.study = ""
            userSession.isLoggedIn = true

            showSelectSubject = true   // ✅ This permanently moves you
        
        }
        
    }
}

