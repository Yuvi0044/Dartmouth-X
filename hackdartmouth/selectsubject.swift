import SwiftUI

struct SelectSubjectPage: View {
    @EnvironmentObject var userSession: UserSession
    @State private var subject = ""
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        VStack(spacing: 30) {
            Spacer(minLength: 20)

            Text("Find your perfect study group!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, 10)

            VStack(spacing: 5) {
                TextField("Type your subject here...", text: $subject)
                    .focused($isTextFieldFocused)
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .padding(.bottom, 5)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)

                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 30)

            VStack(spacing: 18) {
                Button(action: {
                    isTextFieldFocused = false
                    userSession.study = subject
                }) {
                    Text("Look for Study Group")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }

                Button(action: {
                    isTextFieldFocused = false
                    userSession.study = subject
                }) {
                    Text("Create Your Own Study Group")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
            .padding(.horizontal, 30)

            Spacer()
        }
        .background(Color.black.ignoresSafeArea())
        .preferredColorScheme(.dark)
        .onTapGesture {
            isTextFieldFocused = false
        }
    }
}

