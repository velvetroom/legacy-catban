import Foundation

protocol ProjectLoaderProtocol {
    func load(completion:@escaping((Project) -> Void))
}
