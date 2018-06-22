import XCTest
import Shared
import Board
@testable import Load

class TestInteractor_Transitions:XCTestCase {
    private var interactor:Interactor!
    private var view:Load.View!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryBoardType = MockRepositoryBoardProtocol.self
        MockRepositoryBoardProtocol.error = nil
        self.view = Load.View()
        self.interactor = view.presenter.interactor
        self.transition = MockTransitionProtocol()
        self.view.transition = self.transition
    }
    
    func testBoardLoadedTransitionsToHome() {
        let expect:XCTestExpectation = self.expectation(description:"Waiting transition")
        self.transition.onTransitionToHome = { (project:ProjectManagedProtocol) in
            XCTAssertTrue(Thread.isMainThread, "Should be on main thread")
            expect.fulfill()
        }
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            let board:BoardProtocol = BoardFactory.newBoard()
            let project:ProjectProtocol = ProjectFactory.newProject()
            let managed:ProjectManagedProtocol = board.manage(project:project)
            self?.interactor.open(project:managed)
        }
        
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testTransitionsToHomeIfOneProject() {
        let expect:XCTestExpectation = self.expectation(description:"Waiting transition")
        self.configureBoardWithOneProject()
        self.transition.onTransitionToHome = { (project:ProjectManagedProtocol) in
            XCTAssertTrue(Thread.isMainThread, "Should be on main thread")
            expect.fulfill()
        }
        
        self.interactor.didLoad()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testTransitionsToProjectsIfNoProject() {
        let expect:XCTestExpectation = self.expectation(description:"Waiting transition")
        MockRepositoryBoardProtocol.board = BoardFactory.newBoard()
        self.transition.onTransitionToProjects = {
            XCTAssertTrue(Thread.isMainThread, "Should be on main thread")
            expect.fulfill()
        }
        
        self.interactor.didLoad()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testTransitionsToProjectsIfMultipleProjects() {
        let expect:XCTestExpectation = self.expectation(description:"Waiting transition")
        self.configureBoardWithMultipleProjects()
        self.transition.onTransitionToProjects = {
            XCTAssertTrue(Thread.isMainThread, "Should be on main thread")
            expect.fulfill()
        }
        
        self.interactor.didLoad()
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
