import SwiftUI
import Apollo

struct ScenesView: View {
    @StateObject private var viewModel = ScenesViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.scenes) { scene in
                Text(scene.title)
            }
            .navigationTitle("Scenes")
            .onAppear {
                viewModel.loadScenes()
            }
        }
    }
}

class ScenesViewModel: ObservableObject {
    @Published var scenes: [Scene] = []

    func loadScenes() {
        StashService.shared.apollo.fetch(query: ScenesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let allScenes = graphQLResult.data?.allScenes {
                    self.scenes = allScenes.compactMap { scene in
                        guard let id = scene.id, let title = scene.title else { return nil }
                        return Scene(id: id, title: title)
                    }
                }
            case .failure(let error):
                print("Error loading scenes: \(error)")
            }
        }
    }
}

struct Scene {
    let id: String
    let title: String
}
