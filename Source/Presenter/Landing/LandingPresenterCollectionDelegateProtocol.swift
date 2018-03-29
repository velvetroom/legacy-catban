import Foundation

protocol LandingPresenterCollectionDelegateProtocol:AnyObject {
    func delegateSelectCellAt(index:IndexPath)
    func delegateDeselectCell()
}
