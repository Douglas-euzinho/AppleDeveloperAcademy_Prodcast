//
//  PodcastAppUpdateTests.swift
//  PodcastAppTests
//
//  Created by Felipe Brigagão de Almeida on 12/01/22.
//

import XCTest
@testable import PodcastApp

class PodcastAppUpdateTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // --------------------
    // MARK: - UPDATE EPISODE
    /// Uses PersistenceController to create and update the episode name, and verify if the name was updated correctly.
    /// - Parameters:
    ///    - persistenceController: Uses PersistenceController(isMemory: true) Used to change the Data Base to "/dev/null".
    ///    - episode: Used to create an episode with (title: , status: , date: ) into "/dev/null".
    ///    - title: Used to set a title to the episode.
    ///    - saveContext(): Used to update the Data Base.
    /// - XCTAssertEqual: Is used to verify if the content passed into the parameters is equivalent.
    // --------------------
    func testUpdateEpisode() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episodio 1", status: 0, date: Date())
        episode.title = "Episodio Novo"
        try! persistenceController.saveContext()
        XCTAssertEqual(persistenceController.fetchAllEpisodes().first?.title, "Episodio Novo", "Error episodio update title")
    }
    
    func testUpdateScript() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episodio 1", status: 0, date: Date())
        let script = try! persistenceController.createScript(typeOfScript: 1, episode: episode)
        
        XCTAssertEqual(1, persistenceController.fetchAllEpisodes().count)
        XCTAssertNotNil(persistenceController.fetchAllEpisodes().first?.script)
        
        script.type = 3
        try! persistenceController.saveContext()
        
        XCTAssertEqual(3, persistenceController.fetchAllEpisodes().first?.script?.type, "The type is not equal.")
        
    }
    
    func testUpdateTopic() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episodio 1", status: 0, date: Date())
        let script = try! persistenceController.createScript(typeOfScript: 1, episode: episode)
        try! persistenceController.createTopic(title: "Tópico Update", script: script)
        
        XCTAssertEqual(1, persistenceController.fetchAllEpisodes().first?.script?.topics?.count, "There is no Topic.")
        
        (script.topics?.allObjects as! [Topic]).first?.content = "Qualquer texto pra gente ver."
        
        try! persistenceController.saveContext()
        
        XCTAssertEqual("Qualquer texto pra gente ver.", (persistenceController.fetchAllEpisodes().first?.script?.topics?.allObjects as! [Topic]).first?.content, "The content waas not updated.")
    }
}
