import SwiftUI

struct HomePage: View {
    @State private var showRequestInvite = false
    @State private var selectedListing = ""
    @State private var isPlusButtonPressed = false
    @State private var pressedListingIndex: Int? = nil

    let listings = ["Chemistry: Organic", "Chemistry: General Chemistry", "Biology: Photosynthesis"]
    let descriptions = ["Studying chapter 3 in Orgo", "Studying chapter 2 in Gen Chem, Matter", "Clearing concepts of chlorophyll"]
    let durations = ["3 hours", "1 hour", "15 mins"]
    

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
                        // Plus button action
                    }) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .padding(10)
                            .background(isPlusButtonPressed ? Color.orange.opacity(0.7) : Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(color: Color.orange.opacity(0.4), radius: 8, x: 0, y: 4)
                    }
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { _ in isPlusButtonPressed = true }
                            .onEnded { _ in isPlusButtonPressed = false }
                    )
                }
                .padding(.horizontal)
                .padding(.top, 40)

                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(listings.indices, id: \.self) { index in
                            Button(action: {
                                selectedListing = listings[index]
                                showRequestInvite = true
                            }) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(listings[index])
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(.black)

                                    Text(descriptions[index])
                                        .font(.system(size: 14, weight: .regular, design: .rounded))
                                        .foregroundColor(.gray)

                                    Text("Duration: \(durations[index])")
                                        .font(.system(size: 12, weight: .light, design: .rounded))
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(pressedListingIndex == index ? Color.gray.opacity(0.3) : Color.white)
                                .cornerRadius(20)
                                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 6)
                                .padding(.horizontal)
                            }
                            .simultaneousGesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { _ in pressedListingIndex = index }
                                    .onEnded { _ in pressedListingIndex = nil }
                            )
                        }
                    }
                    .padding(.top, 10)
                }

                Spacer()
            }
            .background(Color(red: 249/255, green: 244/255, blue: 233/255))
            .ignoresSafeArea()
            .navigationBarHidden(true)
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
}
