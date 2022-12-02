//
//  VistaQuizPlay.swift
//  laboratorio
//
//  Created by b116 DIT UPM on 18/11/22.
//

import SwiftUI

struct VistaQuizPlay: View {
    
    
    
    
    var quiz : QuizItem
    @State var respuesta = ""
    @State private var Alerta = false
    @State private var AlertTitulo = "MAL"
    @State private var AlertMessage = "- 1/3 de la pregunta"
    
    @Environment (\.verticalSizeClass) var verticalSizeClass
    @EnvironmentObject var score : Scoremodel
    
    
    var body: some View {
        
        if (verticalSizeClass == .compact){
            
            HStack{
                
                VStack{
                    Text(quiz.question).font(.title).fontWeight(.black)
                    Image(quiz.favourite ? "estrella" : "benzema")
                        .resizable()
                        .frame(width: 30  ,height: 30)
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(lineWidth: 2))
                    TextField("Escribe la respuesta", text: $respuesta )
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5))
                    
                    
                    HStack{
                        Button("¿Correcto?"){
                            if (respuesta.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)) {
                                score.insertar(objetoquiz: quiz)
                                Alerta = true
                                AlertTitulo = "Muy bien"
                                AlertMessage = "Mu listo"
                            }
                            
                            else if (respuesta.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == ""){
                                Alerta = true
                                AlertTitulo = "EN BLANCOOO"
                                AlertMessage = "Espabila hombre que no resta"
                                
                            }
                            else{
                                Alerta = true
                            }
                            
                        }
                        .padding()
                        .alert (isPresented: $Alerta){
                            Alert(
                                title: Text(AlertTitulo),
                                message: Text(AlertMessage),
                                dismissButton: .default(Text("ok")))
                        }
                        
                        Text("Score =  \(score.correctas.count)")
                        Button("Reset Score"){
                            score.reset()
                            Alerta = true
                            AlertTitulo = "Has conseguido \(score.correctas.count)"
                            AlertMessage = " Score reseteado, gracias por jugar"
                        }.alert (isPresented: $Alerta){
                            Alert(
                                title: Text(AlertTitulo),
                                message: Text(AlertMessage),
                                dismissButton: .default(Text("volver a jugar")))
                        
                        }
                        
                        
                    }
                    HStack{
                        Text(quiz.author?.username ?? "anonimo")
                        AsyncImage(url: quiz.author?.photo?.url){   phase in
                            if quiz.author?.photo?.url == nil{
                                Color.red
                            }
                            else if let image = phase.image {
                                image.resizable()
                            }
                            else if phase.error != nil{
                                Color.yellow
                            }
                            else {
                                ProgressView()
                            }
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(lineWidth: 2))
                    }
                    
                }
                GeometryReader{ g in
                    VStack{
                        
                        AsyncImage(url: quiz.attachment?.url){   phase in
                            if quiz.attachment?.url == nil{
                                Color.red
                            }
                            else if let image = phase.image {
                                image.resizable()
                            }
                            else if phase.error != nil{
                                Color.yellow
                            }
                            else {
                                ProgressView()
                            }
                        }
                        .frame(width: g.size.width, height: g.size.height)
                        .cornerRadius(20)
                        .scaledToFit()
                        
                        
                    }
                    
                }
                
            }
            
            
            
            
            
            
            
            
        }else{
            HStack{
                Text(quiz.question).font(.title).fontWeight(.black)
                Image(quiz.favourite ? "estrella" : "benzema")
                    .resizable()
                    .frame(width: 30  ,height: 30)
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(lineWidth: 2))
                
            }
            
            
            TextField("Escribe la respuesta", text: $respuesta )
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5))
            
            GeometryReader{ g in
                VStack{
                    
                    AsyncImage(url: quiz.attachment?.url){   phase in
                        if quiz.attachment?.url == nil{
                            Color.red
                        }
                        else if let image = phase.image {
                            image.resizable()
                        }
                        else if phase.error != nil{
                            Color.yellow
                        }
                        else {
                            ProgressView()
                        }
                    }
                    .frame(width: g.size.width, height: g.size.height)
                    .cornerRadius(20)
                    .scaledToFit()
                    
                    
                }
                
            }
            Spacer()
            
            
            VStack{
                HStack{
                    Button("¿Correcto?"){
                        if (respuesta.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)) {
                            score.insertar(objetoquiz: quiz)
                            Alerta = true
                            AlertTitulo = "Muy bien"
                            AlertMessage = "Mu listo"
                        }
                        
                        else if (respuesta.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == ""){
                            Alerta = true
                            AlertTitulo = "EN BLANCOOO"
                            AlertMessage = "Espabila hombre que no resta"
                            
                        }
                        else{
                            Alerta = true
                        }
                        
                    }
                    .padding()
                    .alert (isPresented: $Alerta){
                        Alert(
                            title: Text(AlertTitulo),
                            message: Text(AlertMessage),
                            dismissButton: .default(Text("ok")))
                    }
                    
                    Text("Score =  \(score.correctas.count)")
                    Button("Reset Score"){
                        score.reset()
                        Alerta = true
                        AlertTitulo = "Has conseguido \(score.correctas.count)"
                        AlertMessage = " Score reseteado, gracias por jugar"
                    }.alert (isPresented: $Alerta){
                        Alert(
                            title: Text(AlertTitulo),
                            message: Text(AlertMessage),
                            dismissButton: .default(Text("volver a jugar")))
                    
                    }
                    
                }
                HStack{
                    Text(quiz.author?.username ?? "anonimo")
                    AsyncImage(url: quiz.author?.photo?.url){   phase in
                        if quiz.author?.photo?.url == nil{
                            Color.red
                        }
                        else if let image = phase.image {
                            image.resizable()
                        }
                        else if phase.error != nil{
                            Color.yellow
                        }
                        else {
                            ProgressView()
                        }
                    }
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(lineWidth: 2))
                }
                
            }
            
            .navigationTitle(Text("Play"))
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
        
    }
    
}

