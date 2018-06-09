import UIKit

public struct Configuration {
    public static var repositoryBoardType:RepositoryBoardProtocol.Type!
    public static var repositoryProjectType:RepositoryProjectProtocol.Type!
    public static var viewLoadType:UIViewController.Type!
    public static var viewHomeType:UIViewController.Type!
    public static var viewCardType:UIViewController.Type!
    public static var viewColumnType:UIViewController.Type!
    public static var viewProjectsType:UIViewController.Type!
    public static var canvasType:CanvasProtocol.Type!
    public static var directoryRoot:String!
}
