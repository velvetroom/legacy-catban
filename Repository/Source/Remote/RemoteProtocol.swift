import Foundation

protocol RemoteProtocol {
    func makeIdentifier(onCompletion:@escaping((String) -> Void), onError:@escaping((Error) -> Void))
}
