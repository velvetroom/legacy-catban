import Foundation

public struct Configuration {
    public static var repositoryBoardType:RepositoryBoardProtocol.Type!
    public static var repositoryProjectType:RepositoryProjectProtocol.Type!
    public static var viewLoadType:View.Type!
    public static var viewHomeType:ViewProject.Type!
    public static var viewCardType:ViewCard.Type!
    public static var viewColumnType:ViewColumn.Type!
    public static var viewProjectsType:ViewBoard.Type!
    public static var canvasType:CanvasProtocol.Type!
    public static var directoryRoot:String!
}
