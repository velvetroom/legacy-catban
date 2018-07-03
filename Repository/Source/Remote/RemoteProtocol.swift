import Foundation

protocol RemoteProtocol {
    func makeIdentifier(onCompletion:@escaping((String) -> Void), onError:@escaping((Error) -> Void))
    func save(data:Data, identifier:String, onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void))
}
