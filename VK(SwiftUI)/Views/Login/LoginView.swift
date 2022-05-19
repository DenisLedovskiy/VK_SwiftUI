//
//  ContentView.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 24.04.2022.
//

import SwiftUI
import Combine

struct LoginView: View {

    private let keyboardIsOnPublisher = Publishers.Merge( NotificationCenter.default.publisher(for:
UIResponder.keyboardWillChangeFrameNotification)
        .map { _ in true },
        NotificationCenter.default.publisher(for:
UIResponder.keyboardWillHideNotification)
        .map { _ in false }
    )
        .removeDuplicates()


    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true

    @State private var showIncorrectCredentialWarning: Bool = false
    @Binding var isUserLoggedIn: Bool

    func verifyLoginData() {
        if login.elementsEqual("login") && password.elementsEqual("123") {
            isUserLoggedIn = true
        } else {
            showIncorrectCredentialWarning = true
        }
        password = ""
    }

//    init(isUserLoggedIn: Binding<Bool>) {
//        self.isUserLoggedIn = isUserLoggedIn
//    }

    var body: some View {

        ZStack {
            GeometryReader { geometry in Image("VK")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .luminanceToAlpha()
                    .frame(maxWidth: geometry.size.width, maxHeight:
                            geometry.size.height)
            }

            ScrollView(showsIndicators: false) {

                VStack {

                    if shouldShowLogo {
                        Image("VKLogo")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 300, height: 300, alignment: .top)
                            .padding(.bottom, 50)
                    }

                    VStack {

                        HStack {
                            Text("Login:")
                                .foregroundColor(.white)
                                .font(.custom("Arial", fixedSize: 25)
                                    .bold())
                            Spacer()
                            TextField("", text: $login)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Password:")
                                .foregroundColor(.white)
                                .font(.custom("Arial", fixedSize: 25)
                                    .bold())
                            Spacer()
                            SecureField("", text: $password)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }.frame(maxWidth: 300)

//                    MARK: Почему-то если настраиваю текст кнопки, перестает работать модификатор на сокрытие кнопки
                        Button(action: verifyLoginData) {
                        Text("Log in")
//                            .foregroundColor(.white)
//                            .font(.custom("Arial", fixedSize: 25)
//                                .bold())
                    }.padding(.top, 50)
                        .padding(.bottom, 20)
                        .disabled(login.isEmpty || password.isEmpty)
                }
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in withAnimation(Animation.easeInOut(duration: 0.5)) {
                self.shouldShowLogo = !isKeyboardOn
            }
        }
            }.onTapGesture {
                UIApplication.shared.endEditing()
            }.alert(isPresented: $showIncorrectCredentialWarning, content: {
                Alert(title: Text("Ошибка"), message: Text("Неверно введен Login или Password"))
            })
        }

}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(isUserLoggedIn: false)
//    }
//}

