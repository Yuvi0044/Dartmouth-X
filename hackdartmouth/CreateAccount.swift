import SwiftUI

struct CreateAccountPage: View {
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var name = ""
    @State private var university = ""
    @State private var phoneNumber = ""
    @State private var accountCreated = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            if accountCreated {
                VStack {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.green)
                        .scaleEffect(accountCreated ? 1.2 : 1.0)
                        .animation(.easeIn(duration: 0.5), value: accountCreated)
                    
                    Text("Account Created!")
                        .font(.title2)
                        .foregroundColor(.green)
                        .padding(.top)
                }
            } else {
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)

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

                Button("Submit") {
                    withAnimation {
                        accountCreated = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        isLoggedIn = true
                    }
                }
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.top)
            }

            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
    }
}

