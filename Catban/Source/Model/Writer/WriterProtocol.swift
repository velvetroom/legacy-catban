import Foundation

protocol WriterProtocol:ModelProtocol {
    var presenter:WriterPresenterProtocol { get set }
    var text:String { get set }
    var onFinish:((String) -> Void)? { get set }
    
    func finishedWriting()
}
