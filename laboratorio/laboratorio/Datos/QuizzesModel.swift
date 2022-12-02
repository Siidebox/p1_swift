//
//  QuizzesModel.swift
//  Quiz con SwiftUI
//
//  Created by Santiago Pavón Gómez on 18/10/22.
//

import Foundation

//heredar todo lo de clase ya hecha ObservableObject en Quizzmodel. ObservableObject repinta cada vez que varia algo

class QuizzesModel: ObservableObject {
    
    // Los datos
    // quizzes es una variable. Array [] del tipo QuizItem y luego () para llamar al constructor de Quizitem
    
    
    //@published publica cambios. Todo el acceda sabe que ha cambiado y entonces volverá a repintarse
    
    @Published private(set) var quizzes = [QuizItem]()
    // private(set) es porque es un array con mis quizz providos, otros archivos pueden verla, pero ninungo salvo este archivo puede modificarla (set)
    
    
    //load es el carga datos del server o desde un archivo.Guarda los quizzes del server en nuestro array quizzes
    func load() {
        //jsonURL es el path a donde está ese fichero
        guard let jsonURL = Bundle.main.url(forResource: "quizzes", withExtension: "json") else {
            print("Internal error: No encuentro p1_quizzes.json")
            return
        }
        
        do {
            //data es un objeto Data con el contenido de la direccion jsonURL. Puede lanzar errores de ahi el try
            let data = try Data(contentsOf: jsonURL)
            //decode, maquina de decodifica json
            let decoder = JSONDecoder()
            
            // if let str = String(data: data, encoding: String.Encoding.utf8) {
            //                print("Quizzes ==>", str)
            //            }
            
            
            // decode. quiero que desde data me devuelvas un array de QuizItems
            self.quizzes = try decoder.decode([QuizItem].self, from: data)
            
            print("Quizzes cargados")
        } catch {
            print("Algo chungo ha pasado: \(error)")
        }
    }
}
