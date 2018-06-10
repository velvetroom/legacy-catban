import Foundation

public struct Configuration {
    public static var repositoryBoardType:RepositoryBoardProtocol.Type!
    public static var repositoryProjectType:RepositoryProjectProtocol.Type!
    public static var viewLoadType:PresentingViewProtocol.Type!
    public static var viewHomeType:PresentingViewProtocol.Type!
    public static var viewCardType:PresentingViewProtocol.Type!
    public static var viewColumnType:PresentingViewProtocol.Type!
    public static var viewProjectsType:PresentingViewProtocol.Type!
    public static var canvasType:CanvasProtocol.Type!
    public static var directoryRoot:String!
}
