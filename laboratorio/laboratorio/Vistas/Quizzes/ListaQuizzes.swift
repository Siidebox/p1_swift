//
//  ContentView.swift
//  Practica-1
//
//  Created by b116 DIT UPM on 8/11/22.
//

import SwiftUI

struct ListaQuizzes: View {
    //@enviromnetObject busca dentro de enviroment algo del tipo QuizzesModel y lo asignas
    @EnvironmentObject var QuizModelo: QuizzesModel
    
    
    @Environment (\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
       
        NavigationStack{
            if (verticalSizeClass == .compact){
                List{
                    ForEach(QuizModelo.quizzes){ quizitem in
                        NavigationLink{
                            VistaQuizPlay(quiz: quizitem)
                            
                        }
                    label:{
                        VistaQuizz(quiz: quizitem)
                        
                    }
                        
                    }
                    .padding()
                    .onAppear{
                        QuizModelo.load()
                    }
                }
                .navigationTitle(Text("Quiz"))
                
                
              
                
                
            }else {
                List{
                    ForEach(QuizModelo.quizzes){ quizitem in
                        NavigationLink{
                            VistaQuizPlay(quiz: quizitem)
                            
                        }
                    label:{
                        VistaQuizz(quiz: quizitem)
                        
                    }
                        
                    }
                    .padding()
                    .onAppear{
                        QuizModelo.load()
                    }
                }
                .navigationTitle(Text("Quiz"))
                
                
                
                
                
            }
            
           
            
        }.onAppear{
            QuizModelo.load()
        }
    }
    
}
