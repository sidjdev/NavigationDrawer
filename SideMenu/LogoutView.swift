//
//  LogoutView.swift
//  SideMenu
//
//  Created by Sidharth J Dev on 23/04/20.
//  Copyright © 2020 Sidharth J Dev. All rights reserved.
//

import SwiftUI

struct LogoutView: View {
    @State private var showingMenu = false
        var body: some View {
            ZStack {
                
                Color.green.edgesIgnoringSafeArea(
                    .all)
                VStack(alignment: .leading) {
                    Button(action: {self.showingMenu.toggle()}) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.white)
                    }
                    .frame(width: 50.0, height: 50.0)
                    Spacer()
                    Text("This Is Logout")
                        .font(
                            .largeTitle)
                        .foregroundColor(
                            .white)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }.padding(.horizontal) .frame(maxWidth: .infinity)
            }
            .offset(x: showingMenu ? 200.0 : 0.0, y: 0)
            .animation(.easeOut)
        }
}

struct LogoutView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutView()
    }
}
