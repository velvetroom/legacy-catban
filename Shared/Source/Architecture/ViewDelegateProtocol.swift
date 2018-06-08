import Foundation

public protocol ViewDelegateProtocol {
    init()
    func didLoad(view:View)
    func didAppear(view:View)
    func orientationChanged()
}
