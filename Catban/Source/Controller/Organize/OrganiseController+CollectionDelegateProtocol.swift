import Foundation

extension OrganiseController:OrganisePresenterCollectionDelegateDelegateProtocol {
    func delegateSelectCellAt(index:IndexPath) {
        self.model.selectProjectAt(index:index.item)
        self.navigation?.transitionToLandingWith(board:self.model.board)
    }
}
