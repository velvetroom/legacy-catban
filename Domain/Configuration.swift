import Foundation

struct Configuration:ConfigurationProtocol {
    typealias BoardType = Board_v1
}

private protocol ConfigurationProtocol {
    associatedtype BoardType:BoardProtocol
}
