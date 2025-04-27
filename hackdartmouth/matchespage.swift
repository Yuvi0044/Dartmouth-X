import SwiftUI
struct MatchesPage: View {
    var body: some View {
        VStack(spacing: 20) {
            // Heading
            Text("Your Study Match")
                .font(.largeTitle)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .padding(.top, 70)
            
            // Matched users container
            HStack(spacing: 30) {
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.blue)
                    Text("You")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.purple)
                    Text("Partner")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 6)
            .padding(.horizontal)

            // Study Session Details
            VStack(alignment: .leading, spacing: 8) {
                Text("Study Topic: Chemistry - Organic")
                    .font(.headline)
                    .foregroundColor(.black)
                Text("Duration: 3 hours")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 6)
            .padding(.horizontal)
            .padding(.top, 10)

            // Action Buttons
            VStack(spacing: 16) {
                Button(action: {
                    // TODO: Open location map page
                }) {
                    Text("Open Location")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }

                Button(action: {
                    // TODO: Upload Notes
                }) {
                    Text("Upload Notes")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        
                }

                Button(action: {
                    // TODO: Summarize Notes
                }) {
                    Text("Summarize Notes")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)

            Spacer()
        }
        .background(Color(red: 249/255, green: 244/255, blue: 233/255)) // ✨ Same creamy fun background
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct MatchesPage_Previews: PreviewProvider {
    static var previews: some View {
        MatchesPage()
    }
}

