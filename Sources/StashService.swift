import Apollo

class StashService {
    static let shared = StashService()
    var apollo: ApolloClient

    private init() {
        let serverURL = UserDefaults.standard.string(forKey: "serverURL") ?? "http://localhost:9999"
        let apiKey = KeychainHelper.getToken(forKey: "apiKey") ?? ""
        let url = URL(string: serverURL + "/graphql")!
        let configuration = URLSessionConfiguration.default
        if !apiKey.isEmpty {
            configuration.httpAdditionalHeaders = ["ApiKey": apiKey]
        }
        let transport = HTTPNetworkTransport(url: url, configuration: configuration)
        apollo = ApolloClient(networkTransport: transport)
    }

    func updateClient() {
        let serverURL = UserDefaults.standard.string(forKey: "serverURL") ?? "http://localhost:9999"
        let apiKey = KeychainHelper.getToken(forKey: "apiKey") ?? ""
        let url = URL(string: serverURL + "/graphql")!
        let configuration = URLSessionConfiguration.default
        if !apiKey.isEmpty {
            configuration.httpAdditionalHeaders = ["ApiKey": apiKey]
        }
        let transport = HTTPNetworkTransport(url: url, configuration: configuration)
        apollo = ApolloClient(networkTransport: transport)
    }
}
