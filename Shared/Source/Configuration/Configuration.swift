import Foundation

public struct Configuration {
    public static var repositoryBoardType:RepositoryBoardProtocol.Type!
    public static var repositoryProjectType:RepositoryProjectProtocol.Type!
    public static var viewLoadType:View.Type!
    public static var viewHomeType:View.Type!
    public static var viewCardType:View.Type!
    public static var viewColumnType:View.Type!
    public static var viewProjectsType:View.Type!
    public static var canvasType:CanvasProtocol.Type!
    public static var directoryRoot:String!
}
