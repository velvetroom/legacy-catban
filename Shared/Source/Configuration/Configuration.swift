import Foundation
import CleanArchitecture

public struct Configuration {
    public static var repositoryBoardType:RepositoryBoardProtocol.Type!
    public static var repositoryProjectType:RepositoryProjectProtocol.Type!
    public static var viewLoadType:ViewProtocol.Type!
    public static var viewHomeType:ViewProtocol.Type!
    public static var viewCardType:ViewProtocol.Type!
    public static var viewColumnType:ViewProtocol.Type!
    public static var viewProjectsType:ViewProtocol.Type!
    public static var viewCloudType:ViewProtocol.Type!
    public static var canvasType:CanvasProtocol.Type!
    public static var directoryRoot:String!
}
