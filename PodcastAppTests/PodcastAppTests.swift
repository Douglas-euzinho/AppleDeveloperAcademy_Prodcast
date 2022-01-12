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
    
    // MARK: - CUSTOM TESTS
    // --------------------
    // MARK: - TEST CREATE EPISODE
    /// Using a database exclusively created for tests, we can simulate our properties and methods to see if their use is doing fine as expected.
    /// - Parameters:
    ///   - controller: Uses PersistenceController(isMemory: true) Used to change the Data Base to "/dev/null".
    ///   - context:
    ///   - episode: Has an Episode class in ir, which is used to use ".status, .date and .title".
    // --------------------
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
    
    // --------------------
    // MARK: - FETCH ALL EPISODES
    /// Uses PersistenceController to create an episode and see if there is only one episode created.
    /// - Parameters:
    ///    - persistenceController: Uses PersistenceController(isMemory: true) Used to change the Data Base to "/dev/null".
    ///    - Underscore_: Used to create an episode with (title: , status: , date: ) into "/dev/null".
    /// - XCTAssertEqual: Is used to verify if the content passed into the parameters is equivalent.
    // --------------------
    func testFetchAllEpisodes() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let _ = try! persistenceController.createEpisode(title: "Episodio 1", status: 0, date: Date())
        XCTAssertEqual(persistenceController.fetchAllEpisodes().count,1, "Equal counts")
    }
    
    // --------------------
    // MARK: - UPDATE EPISODE NAME
    /// Uses PersistenceController to create and update the episode name, and verify if the name was updated correctly.
    /// - Parameters:
    ///    - persistenceController: Uses PersistenceController(isMemory: true) Used to change the Data Base to "/dev/null".
    ///    - episode: Used to create an episode with (title: , status: , date: ) into "/dev/null".
    ///    - title: Used to set a title to the episode.
    ///    - saveContext(): Used to update the Data Base.
    /// - XCTAssertEqual: Is used to verify if the content passed into the parameters is equivalent.
    // --------------------
    func testUpdateEpisodeName() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episodio 1", status: 0, date: Date())
        episode.title = "Episodio Novo"
        try! persistenceController.saveContext()
        XCTAssertEqual(persistenceController.fetchAllEpisodes().first?.title, "Episodio Novo", "Error episodio update title")
    }
    
    // --------------------
    // MARK: - CREATE SCRIPT
    /// Uses PersistenceController to create a script inside of an episode and verify if is not nil and if it is equal.
    /// - Parameters:
    ///    - persistenceController: Uses PersistenceController(isMemory: true) Used to change the Data Base to "/dev/null".
    ///    - episode: Used to create an episode with (title: , status: , date: ) into "/dev/null".
    ///    - script: Used to create and script on an existing episode (typeOfScript: , episode: )
    /// - XCTAssertNotNil: Is used to verify if the specified parameter is not nil, in this case the verification was used to see if the first element of the episode has an script.
    /// - XCTAssertEqual: Is used to verify if the content passed into the parameters is equivalent.
    // --------------------
    func testCreateScript() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episodio 1", status: 0, date: Date())
        let script = try! persistenceController.createScript(typeOfScript: 1, episode: episode)
        
        XCTAssertNotNil(persistenceController.fetchAllEpisodes().first?.script)
        XCTAssertEqual(script.type, persistenceController.fetchAllEpisodes().first?.script?.type, "Script type error")
    }
    
    // --------------------
    // MARK: - CREATE SCRIPT TOPIC
    /// Uses PersistenceController to create a topic inside of an script and verify if is not nil and if it is equal.
    /// - Parameters:
    ///    - persistenceController: Uses PersistenceController(isMemory: true) Used to change the Data Base to "/dev/null".
    ///    - episode: Used to create an episode with (title: , status: , date: ) into "/dev/null".
    ///    - script: Used to create and script on an existing episode (typeOfScript: , episode: )
    ///    - topic: Used to create and topic on an existing script (title: , script: )
    /// - XCTAssertNotNil: Is used to verify if the specified parameter is not nil, in this case the verification was used to see if the first element of the episode has an script.
    /// - XCTAssertEqual: Is used to verify if the content passed into the parameters is equivalent.
    // --------------------
    func testCreateScriptTopic() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episodio 1", status: 0, date: Date())
        let script = try! persistenceController.createScript(typeOfScript: 1, episode: episode)
        let _ = try! persistenceController.createTopic(title: "Topico 1", script: script)
        
        XCTAssertNotNil(persistenceController.fetchAllEpisodes().first?.script?.topics)
        XCTAssertEqual(script.topics, persistenceController.fetchAllEpisodes().first?.script?.topics, "Script Topic error.")
    }
    
    // --------------------
    // MARK: - FETCH ALL TOPICS
    /// Uses PersistenceController to create a topic inside of an script and verify if is not nil.
    /// - Parameters:
    ///    - persistenceController: Uses PersistenceController(isMemory: true) Used to change the Data Base to "/dev/null".
    ///    - episode: Used to create an episode with (title: , status: , date: ) into "/dev/null".
    ///    - script: Used to create and script on an existing episode (typeOfScript: , episode: )
    ///    - topicN: Used to create and topic on an existing script (title: , script: )
    /// - XCTAssertNotNil: Is used to verify if the specified parameter is not nil, in this case the verification was used to see if the first element of the episode has an script.
    // --------------------
    func testFetchAllTopics() throws {
        var persistenceController = PersistenceController(inMemory: true)
        let episode = try! persistenceController.createEpisode(title: "Episódio Buscar Tópicos", status: 0, date: Date())
        let script = try! persistenceController.createScript(typeOfScript: 1, episode: episode)
        let _ = try! persistenceController.createTopic(title: "Topico Buscar Tópicos - 1", script: script)
        let _ = try! persistenceController.createTopic(title: "Topico Buscar Tópicos - 2", script: script)
        let _ = try! persistenceController.createTopic(title: "Topico Buscar Tópicos - 3", script: script)
        
        XCTAssertNotNil(persistenceController.fetchAllEpisodes().first?.script?.topics, "The Script has no topics.")
        XCTAssertEqual(3, persistenceController.fetchAllEpisodes().first?.script?.topics?.count, "See all topics error.")
    }
    
    //: CUSTOM TESTS
}
