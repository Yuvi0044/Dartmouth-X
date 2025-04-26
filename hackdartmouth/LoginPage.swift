import SwiftUI

struct LoginPage: View {
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false
    @State private var showCreateAccount = false

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Image(systemName: "graduationcap.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            Text("StudyBuddy")
                .font(.largeTitle)
                .fontWeight(.bold)

            VStack(spacing: 15) {
                TextField("University Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            if showError {
                Text("Invalid email or password.")
                    .foregroundColor(.red)
            }

            Button(action: {
                if validateCredentials(email: email, password: password) {
                    isLoggedIn = true
                } else {
                    showError = true
                }
            }) {
                Text("Login")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Button(action: {
                showCreateAccount = true
            }) {
                Text("Create Account")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: $showCreateAccount) {
                CreateAccountPage(isLoggedIn: $isLoggedIn)

            }

            Button(action: {
                // Future forgot password action
            }) {
                Text("Forgot Password?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
    }

    func validateCredentials(email: String, password: String) -> Bool {
        return email.hasSuffix(".edu") && !password.isEmpty
    }
}

