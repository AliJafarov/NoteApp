//
//  NetworkManager.swift
//  NoteApp
//
//  Created by Ali Jafarov on 23.07.22.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURL = "https://62dafdd7e56f6d82a76d9ed9.mockapi.io/notes/"
    
    func getNotes (completion: @escaping (Result<[Notes], Error>) -> Void) {
        let request = AF.request(baseURL)
        request.responseData { response in
            if let data = response.data {
                do {
                    let notesResult = try JSONDecoder().decode([Notes].self, from: data)
                    completion(.success(notesResult))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func getNote(id: String, completion: @escaping (Result<Notes, Error>) -> Void ){
        let request = AF.request(baseURL + id )
        request.responseData { response in
            if let data = response.data {
                do {
                    let noteResult = try JSONDecoder().decode(Notes.self, from: data)
                    completion(.success(noteResult))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func addNote(parameters: [String:String], completion: @escaping()->()){
      let request = AF.request(baseURL, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            request.response{ response in
                completion()
        }
    }
    
    func deleteNote(id: String, completion: @escaping()->()){
        let request = AF.request(baseURL + id, method: .delete)
        request.response { response in
            completion()
        }
    }
    
    func updateNote(id: String, parameters: [String:String], completion: @escaping()->()){
        let request = AF.request(baseURL + id, method: .put, parameters: parameters, encoding: JSONEncoding.default)
            request.response{ response in
                completion()
        }
    }
}
