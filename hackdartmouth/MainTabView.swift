import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Label("Subjects", systemImage: "book")
                }
            
            FindPage()
                .tabItem {
                    Label("Find", systemImage: "magnifyingglass")
                }
            
            InvitesPage()
                .tabItem {
                    Label("Invites", systemImage: "envelope")
                }
            
            ProfilePage()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

