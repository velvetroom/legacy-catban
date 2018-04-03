import Foundation

protocol WriterDelegateProtocol:AnyObject {
    func writerFinished(model:WriterProtocol)
}
