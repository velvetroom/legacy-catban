import Foundation

public protocol ViewDelegateProtocol {
    var view:ViewProtocol! { get set }
    
    init()
    func didLoad()
    func didAppear()
    func orientationChanged()
}
