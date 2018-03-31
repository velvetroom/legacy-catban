import Foundation

extension LandingController {
    func reloadViewModelWith(editingCard:IndexPath?) {
        self.viewModelLoader.editingCard = editingCard
        self.reloadViewModel()
    }
}
