import Foundation

class PresenterDelegater {
    weak var presenter:Presenter!
    
    func inject() {
        self.updateList()
        self.updateRenamer()
    }
    
    private func updateList() {
        self.presenter.outlets.list?.delegate = self.presenter.list
        self.presenter.outlets.list?.dataSource = self.presenter.list
        self.presenter.list.view = self.presenter.outlets.list
    }
    
    private func updateRenamer() {
        self.presenter.renamer.view = self.presenter.outlets.renamer
    }
}
