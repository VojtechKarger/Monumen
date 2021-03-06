//
//  ListOfMessages.swift
//  MonumentalAppAzureCup
//
//  Created by vojta on 17.05.2021.
//

import SwiftUI

struct ListOfMessages: View {
    @EnvironmentObject var vm: ChatBotModel
    @Binding var textfieldIsActive: Bool
    var scroll: ScrollViewProxy
    var body: some View {
        ZStack {
            Color.firstBG
            ScrollView(.vertical, showsIndicators: false){
            
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 50, alignment: .center)
                
                ForEach(vm.messages){ message in
                    MessageView(vm: vm, message: message, scroll: scroll)
                }
                if vm.buttonText != "" {
                    Button(action: vm.yesPlease, label: {
                        Text(vm.buttonText ?? "Yes please!")
                    })
                }
            }
        
        }
        .blur(radius: textfieldIsActive ? 0 : 4)
        .onTapGesture {
            withAnimation{
                hideKeyboard()
                vm.hide()
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                withAnimation{
                    textfieldIsActive = true
                }
            }
        }
    }
}


struct ListOfMessages_Previews: PreviewProvider {
    static var previews: some View {
        Chatbot()
            .environmentObject(ChatBotModel())
    }
}
