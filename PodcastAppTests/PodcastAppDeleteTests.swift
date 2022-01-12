//
//  PodcastAppDeleteTests.swift
//  PodcastAppTests
//
//  Created by Felipe Brigagão de Almeida on 12/01/22.
//

import XCTest
@testable import PodcastApp

class PodcastAppDeleteTests: XCTestCase {

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
    
    func testDeleteEpisode() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episódio Deletar Tópico", status: 0, date: Date())
        
        XCTAssertEqual(1, persistenceController.fetchAllEpisodes().count, "Episode Created")
        XCTAssertTrue(persistenceController.deleteObjectInContext(object: episode), "Episode Deleted")
    }
    
    func testDeleteScript() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episódio Deletar Roteiro", status: 0, date: Date())
        let script = try! persistenceController.createScript(typeOfScript: 1, episode: episode)
        
        XCTAssertNotNil(persistenceController.fetchAllEpisodes().first?.script, "There is no script.")
        XCTAssertTrue(persistenceController.deleteObjectInContext(object: script))
        XCTAssertNil(persistenceController.fetchAllEpisodes().first?.script, "There is an script.")
    }
    
    func testDeleteOneTopic() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episódio Deletar Roteiro", status: 0, date: Date())
        let script = try! persistenceController.createScript(typeOfScript: 1, episode: episode)
        
        for i in 0..<5 {
            try! persistenceController.createTopic(title: "Topico Deletar - \(i)", script: script)
        }
        
        XCTAssertEqual(5, persistenceController.fetchAllEpisodes().first?.script?.topics?.count, "Does not have 5 Topics.")
        XCTAssertTrue(persistenceController.deleteObjectInContext(object: (script.topics?.allObjects as! [Topic]).first!))
        XCTAssertEqual(4, persistenceController.fetchAllEpisodes().first?.script?.topics?.count, "Does not have 4 Topics.")
    }
    
    func testDeleteAllTopics() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episódio Deletar Roteiro", status: 0, date: Date())
        let script = try! persistenceController.createScript(typeOfScript: 1, episode: episode)
        
        for i in 0..<5 {
            try! persistenceController.createTopic(title: "Topico Deletar - \(i)", script: script)
        }
        
        XCTAssertEqual(5, persistenceController.fetchAllEpisodes().first?.script?.topics?.count, "Does not have 5 Topics.")
        (script.topics?.allObjects as! [Topic]).forEach { topic in
            XCTAssertTrue(persistenceController.deleteObjectInContext(object: topic)
            )
        }
        XCTAssertEqual(0, persistenceController.fetchAllEpisodes().first?.script?.topics?.count, "There is topics.")
    }
    
    func testDeleteAllTopicsWhenDeleteScript() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episódio Deletar Roteiro", status: 0, date: Date())
        let script = try! persistenceController.createScript(typeOfScript: 1, episode: episode)
        
        for i in 0..<5 {
            try! persistenceController.createTopic(title: "Topico Deletar - \(i)", script: script)
        }
        
        XCTAssertEqual(5, persistenceController.fetchAllEpisodes().first?.script?.topics?.count, "Does not have 5 Topics.")
        XCTAssertTrue(persistenceController.deleteObjectInContext(object: script))
        XCTAssertNil(persistenceController.fetchAllEpisodes().first?.script)
    }
}
