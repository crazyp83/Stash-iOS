import SwiftUI

struct SettingsView: View {
    @State private var serverURL: String = UserDefaults.standard.string(forKey: "serverURL") ?? ""
    @State private var apiKey: String = KeychainHelper.getToken(forKey: "apiKey") ?? ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Server Settings")) {
                    TextField("Server URL (e.g., http://localhost:9999)", text: )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("API Key", text: )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button("Save") {
                    UserDefaults.standard.set(serverURL, forKey: "serverURL")
                    KeychainHelper.saveToken(apiKey, forKey: "apiKey")
                    StashService.shared.updateClient()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .navigationTitle("Settings")
        }
    }
}
