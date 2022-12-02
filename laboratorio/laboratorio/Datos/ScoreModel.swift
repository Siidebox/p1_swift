//
//  Score.swift
//  laboratorio
//
//  Created by b116 DIT UPM on 25/11/22.
//

import Foundation

class Scoremodel: ObservableObject{
    @Published private(set) var correctas : Set<Int> = []
    
    func insertar(objetoquiz : QuizItem){
        correctas.insert(objetoquiz.id
    )
    }
    func reset(){
        correctas.removeAll()
    }
    
}

