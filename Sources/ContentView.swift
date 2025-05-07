import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ScenesView()
                .tabItem {
                    Label("Scenes", systemImage: "film")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
