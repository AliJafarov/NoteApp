//
//  NotesViewModel.swift
//  NoteApp
//
//  Created by Ali Jafarov on 23.07.22.
//

import UIKit

class NotesViewModel {
    
    var notesArray: [Notes] = []
    
    func getNotes(completion: @escaping ()->()){
        NetworkManager.shared.getNotes { [weak self] result in
            guard let self = self else {return}
            switch result {
                case .success(let notes):
                    self.notesArray = notes
                    completion()
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func deleteNotes(id: String, completion: @escaping ()->() ){
        NetworkManager.shared.deleteNote(id: id){
            completion()
        }
    }
    
    
}
