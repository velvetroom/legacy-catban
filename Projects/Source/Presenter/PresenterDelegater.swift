import Foundation

class PresenterDelegater {
    weak var presenter:Presenter!
    
    func inject() {
        self.updateList()
        self.updateRenamer()
        self.updatePresenterForKeyboard()
    }
    
    private func updateList() {
        self.presenter.list.view = self.presenter.outlets.list
    }
    
    private func updateRenamer() {
        self.presenter.renamer.view = self.presenter.outlets.renamer
    }
    
    private func updatePresenterForKeyboard() {
        self.presenter.presenterForKeyboard.viewContainer = self.presenter.outlets.renamer
        self.presenter.presenterForKeyboard.layoutBottom = self.presenter.outlets.renamer?.layoutBottom
        self.presenter.presenterForKeyboard.startListening()
    }
}
