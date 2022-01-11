//
//  PodcastAppTests.swift
//  PodcastAppTests
//
//  Created by Victor Brito on 09/12/21.
//

import XCTest
@testable import PodcastApp

class PodcastAppTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testCreateEpisode() throws {
        
        var controller = PersistenceController(inMemory: true)
        let context = controller.context
        expectation(forNotification: .NSManagedObjectContextDidSave, object: context) { _ in
            return true
        }
        
        let episode = Episode(context: context)
        episode.status = 0
        episode.date = Date()
        episode.title = "Episodio 01"
        
        try! context.save()
            
        waitForExpectations(timeout: 1.5) { error in
            XCTAssertNil(error,"Save error")
        }
        
    }
    
    func testFetchAllEpisodes() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let _ = try! persistenceController.createEpisode(title: "Episodio 1", status: 0, date: Date())
        XCTAssertEqual(persistenceController.fetchAllEpisodes().count,1, "Equal counts")
        
    }
    
    
    func testUpdateEpisodeName() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episodio 1", status: 0, date: Date())
        episode.title = "Episodio Novo"
        try! persistenceController.saveContext()
        XCTAssertEqual(persistenceController.fetchAllEpisodes().first?.title, "Episodio Novo", "Error episodio update title")
    }
    
    
    func testCreateScript() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episodio 1", status: 0, date: Date())
        let script = try! persistenceController.createScript(typeOfScript: 1, episode: episode)
        
        XCTAssertNotNil(persistenceController.fetchAllEpisodes().first?.script)
        
        XCTAssertEqual(script.type, persistenceController.fetchAllEpisodes().first?.script?.type, "Script type error")
        
    }
    
    
    
    
    
}
