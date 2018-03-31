import Foundation

extension Landing {
    func update(editingCard:IndexPath?) {
        self.editingCard = editingCard
        self.reloadViewModel()
    }
}
