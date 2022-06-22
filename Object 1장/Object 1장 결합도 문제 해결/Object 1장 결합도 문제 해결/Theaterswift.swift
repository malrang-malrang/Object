//
//  Theater.swift
//  Object 1장
//
//  Created by 김동욱 on 2022/06/22.
//

import Foundation

// 소극장
final class Theater {
    private let ticketSeller: TicketSeller
    
    init(ticketSeller: TicketSeller) {
        self.ticketSeller = ticketSeller
    }
    
    //관람객을 입장시키는 메서드
    func enter(audience: Audience) {
        ticketSeller.sellTo(audience: audience)
    }
}

