import Foundation

public protocol ViewDelegateProtocol:class {
    func didLoad(view:View)
    func didAppear(view:View)
}
