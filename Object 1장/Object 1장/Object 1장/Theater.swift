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
        //관람객의 가방에 초대장이 있다면
        if audience.getBag().hasInvitation() {
            //티켓 셀러가 매표소에서 티켓을 준다.
            let ticket = ticketSeller.getTicketOffice().getTicket()
            audience.getBag().setTicket(ticket: ticket)
            
        //관람객의 가방에 초대장이 없다면
        } else {
            //티켓 셀러가 매표소에서 티켓을 꺼낸다.
            let ticket = ticketSeller.getTicketOffice().getTicket()
            //관람객의 가방에서 티켓의 금액만큼 돈을 뺏는다.
            audience.getBag().minusAmount(amount: ticket.getFee())
            //매표소가 가지고 있는 금액이 티켓의 금액만큼 증가한다.
            ticketSeller.getTicketOffice().plusAmount(amount: ticket.getFee())
            //관람객의 가방에 티켓을 넣어준다.
            audience.getBag().setTicket(ticket: ticket)
        }
    }
}

