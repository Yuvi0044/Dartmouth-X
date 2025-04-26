import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomePage()   // <-- FIXED!
                .tabItem {
                    Label("Find", systemImage: "magnifyingglass")
                }
            
            InvitesPage()
                .tabItem {
                    Label("My Listings", systemImage: "envelope")
                }
            MatchesPage()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                        }
            ProfilePage()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

