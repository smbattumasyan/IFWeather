//
//  NetworkTaskManager.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 15.07.21.
//

import Foundation

final class NetworkTaskManager {
    
    // MARK: - Public properties
    var currentTasksCount = 0
    
    // MARK: - Private properties
    private var tasks: [String: URLSessionTask] = [:]
    
    // MARK: - Public Methods
    func task(forRequest request: URLRequest) -> URLSessionTask? {
        guard let identifier = request.url?.absoluteString else { return nil }
        return tasks[identifier]
    }
    
    func add(_ task: URLSessionTask, forRequest request: URLRequest) {
        guard let identifier = request.url?.absoluteString else { return }
        tasks[identifier] = task
        currentTasksCount += 1
    }
    
    func removeTask(forRequest request: URLRequest) {
        guard let identifier = request.url?.absoluteString else { return }
        tasks[identifier] = nil
        currentTasksCount -= 1
    }
}

