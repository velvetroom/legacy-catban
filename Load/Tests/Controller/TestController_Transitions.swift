import XCTest
@testable import Load
@testable import Shared
@testable import Board

class TestController_Transitions:XCTestCase {
    private var controller:Controller!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryBoardType = MockRepositoryBoardProtocol.self
        MockRepositoryBoardProtocol.error = nil
        self.controller = Controller()
        self.transition = MockTransitionProtocol()
        self.controller.transiton = self.transition
    }
    
    func testBoardLoadedTransitionsToHome() {
        let expect:XCTestExpectation = expectation(description:"Waiting transition")
        self.transition.onTransitionToHome = { (project:ProjectManagedProtocol) in
            XCTAssertTrue(Thread.isMainThread, "Should be on main thread")
            expect.fulfill()
        }
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            let board:BoardProtocol = BoardFactory.newBoard()
            let project:ProjectProtocol = ProjectFactory.newProject()
            let managed:ProjectManagedProtocol = board.manage(project:project)
            self?.controller.open(project:managed)
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testTransitionsToHomeIfOneProject() {
        let expect:XCTestExpectation = expectation(description:"Waiting transition")
        self.configureBoardWithOneProject()
        self.transition.onTransitionToHome = { (project:ProjectManagedProtocol) in
            XCTAssertTrue(Thread.isMainThread, "Should be on main thread")
            expect.fulfill()
        }
        
        self.controller.didLoadPresenter()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testTransitionsToProjectsIfNoProject() {
        let expect:XCTestExpectation = expectation(description:"Waiting transition")
        MockRepositoryBoardProtocol.board = BoardFactory.newBoard()
        self.transition.onTransitionToProjects = {
            XCTAssertTrue(Thread.isMainThread, "Should be on main thread")
            expect.fulfill()
        }
        
        self.controller.didLoadPresenter()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testTransitionsToProjectsIfMultipleProjects() {
        let expect:XCTestExpectation = expectation(description:"Waiting transition")
        self.configureBoardWithMultipleProjects()
        self.transition.onTransitionToProjects = {
            XCTAssertTrue(Thread.isMainThread, "Should be on main thread")
            expect.fulfill()
        }
        
        self.controller.didLoadPresenter()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    private func configureBoardWithOneProject() {
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        board.add(project:project)
        MockRepositoryBoardProtocol.board = board
    }
    
    private func configureBoardWithMultipleProjects() {
        let board:BoardProtocol = BoardFactory.newBoard()
        board.add(project:ProjectFactory.newProject())
        board.add(project:ProjectFactory.newProject())
        MockRepositoryBoardProtocol.board = board
    }
}
