//
//  ProfileView.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                user
                email
                phone
                address
                Spacer()
                logo
            }.padding(.top, AppSpacing.xxxLarge)
        }
        .edgesIgnoringSafeArea(.all)
        .background(AppColors.BackgroudColor)
    }
}

extension ProfileView {
    var user : some View {
        HStack {
            Image(AppIcons.imgUser)
            VStack(alignment: .leading) {
                Text("Sona Setiana")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(AppColors.AccentColor)
                Text("Mobile Developer")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(AppColors.AccentColor)
            }.padding(.horizontal)
            Spacer()
        }.padding()
    }
    var email : some View {
        ItemProfile(
            icon: AppIcons.imgEmail,
            label: "Email",
            title: "sonasetiana13@gmail.com"
        )
    }
    var phone : some View {
        ItemProfile(
            icon: AppIcons.imgContact,
            label: "Nomor Ponsel",
            title: "082215143376"
        )
    }
    var address : some View {
        ItemProfile(
            icon: AppIcons.imgLocation,
            label: "Alamat",
            title: "Jln. Margonda Raya No 46, Kec. Beji, Kel. Depok, Kota. Depok, Jawa Barat 16432"
        )
    }
    var logo : some View {
        HStack{
            Spacer()
            Image(AppIcons.imgLogo).resizable().frame(width: 96, height: 46)
            Spacer()
        }
    }
}

struct ItemProfile: View {
    var icon: String
    var label: String
    var title: String
    var body: some View {
        HStack(alignment: .center) {
            Image(icon)
                .resizable()
                .frame(width: 14, height: 13)
            VStack(alignment: .leading) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(AppColors.AccentColor)
                Text(title)
                    .font(.body)
                    .foregroundColor(AppColors.AccentColor)
            }.padding(.horizontal)
        }.padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
