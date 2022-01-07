//
//  NewProjectScreen.swift
//  PodcastApp
//
//  Created by Victor Brito on 17/12/21.
//

import SwiftUI

struct RoadMapView: View {
    // MARK: - PROPERTIES

    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ScrollView{
                        
                        VStack{
                            Text("Mulheres que correm com os lobos")
                                .font(Font.headline.weight(.bold))
                            //label named by coreData
                            
                            
                            VStack{
                            Text("Introduçao")
                                .font(Font.headline.weight(.bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 52)
                                .padding(.vertical, 20)
                                
                            
                            Text("Olá, aqui é Maria e você está ouvindo ao podcast Vida de Estudante.  Nesse episódio iremos falar sobre o livro Mulheres que correm com os lobos, de Clarissa Pinkola.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 50)
                                //label named by coreData
                                
                                Text("Conteúdo")
                                    .font(Font.headline.weight(.bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 52)
                                    .padding(.vertical, 20)
                                
                                Text(" O livro traz uma série de contos, que foram coletados pela autora ao redor do mundo, em cada conto a autora nos trás uma reflexão sobre o que é ser mulher na sociedade em que vivemos, e o poder transformador que temos em nossas mãos.  Nesse episódio iremos conhecer o conto de La Llorona, que traduzido para o português significa A Chorona. A história de A Chorona tem origem espanhola e surgiu no início do século 16. Sobre esse conto existem muitas versões, que foram se modificando com o passar do tempo, no livro, porém, a autora traz as duas principais versões dessa história, a primeira é uma versão bem antiga e a segunda é uma versão mais atual. ")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 50)
                                //label named by coreData

                                
                                Text("Introduçao")
                                    .font(Font.headline.weight(.bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 52)
                                    .padding(.vertical, 20)
                                    
                                
                                Text("Olá, aqui é Maria e você está ouvindo ao podcast Vida de Estudante.  Nesse episódio iremos falar sobre o livro Mulheres que correm com os lobos, de Clarissa Pinkola.")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 50)
                                //label named by coreData

                                
                                Text("Comentário")
                                    .font(Font.headline.weight(.bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 52)
                                    .padding(.vertical, 20)
                                    
                                
                                Text("A história faz analogia à criatividade e de como ela ocorre. E apesar de ser uma história com um final trágico, ela nos mostra o que podemos mudar e fazer diferente.  Vale lembrar que a criatividade não está ligada necessariamente a uma profissão específica, mas sim, a criatividade é algo natural que sempre acompanhou e acompanha as mulheres. A criatividade se trata do amor por algo, é aquilo que nos faz querer fazer mais, e nos faz realizar esse algo com todo nosso coração.")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 50)
                                //label named by coreData

                                
                                
                                Text("Finalização")
                                    .font(Font.headline.weight(.bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 52)
                                    .padding(.vertical, 20)
                                    
                                
                                Text("Bom gente, o episódio vai ficando por aqui, espero que tenham gostado e refletido bastante sobre essa coisa que é a vida criativa, na maioria das vezes cheia de altos e baixos, mas que ao mesmo tempo é maravilhoso poder exercer a criatividade, não importa como.")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 50)
                                //label named by coreData

                            }
                            
                        }
                    }
                } //: HSTACK
                Spacer()
                    .navigationBarItems(trailing: Button(action: {
                        //TODO: turn on edit screen
                    }) {
                        
                        Text("Editar").bold()
                            .foregroundColor(Color.black)
                    })
                    .navigationBarItems(leading: Button(action: {
                        //TODO: turn on home screen
                    }) {
                        Text("Home")
                            .foregroundColor(Color.black)
                    })
            }
            Spacer()
        }
        .navigationViewStyle(.stack)
    }
}

// MARK: - PREVIEW
struct RoadMapView_Previews: PreviewProvider {
    
    static var previews: some View {
        RoadMapView()
    }
}

