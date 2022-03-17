//
//  NotificationView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/11/22.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var vm = NotificationViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(vm.notifications){ notification in
                    NotificationCell(vm: NotificationCellViewModel(notification: notification))
                        .padding(.top)
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
