//
//  ContentView.swift
//  SideMenu
//
//  Created by Sidharth J Dev on 23/04/20.
//  Copyright © 2020 Sidharth J Dev. All rights reserved.
//

import SwiftUI

class MenuContent: Identifiable, ObservableObject {
    var id = UUID()
    var name: String = ""
    var image: String = ""
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

struct ContentView: View {
    var menu: [MenuContent] = menuContents
    @State var menuItemSelected: MenuContent = menuContents[0]
    var body: some View {
        ZStack {
            List(menu) { menuItem in
                MenuCell(menuItem: menuItem).onTapGesture {
                    self.menuItemSelected = menuItem
                }
            }
            self.selected(Menu: menuItemSelected)
        }
    }
    
    
    func selected(Menu: MenuContent) -> some View {
        switch Menu.name {
        case "Home":
            return AnyView(HomeView())
            
        case "Profile":
            return AnyView(ProfileView())
            
        case "Chat":
            return AnyView(ChatView())
            
        case "Logout":
            return AnyView(LogoutView())
        default:
            return AnyView(HomeView())
        }
    }
}





#if DEBUG
let menuHome = MenuContent(name: "Home", image: "house.fill")
let menuProfile = MenuContent(name: "Profile", image: "person.fill")
let menuChat = MenuContent(name: "Chat", image: "message.fill")
let menuLogout = MenuContent(name: "Logout", image: "power")
let menuContents = [menuHome, menuProfile, menuChat, menuLogout]

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(menu: menuContents)
    }
}
#endif

struct MenuCell: View {
    var menuItem: MenuContent = menuContents[0]
    var body: some View {
        HStack {
            Image(systemName: menuItem.image)
                .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
            Text(menuItem.name).foregroundColor(.orange)
        }
    }
}
