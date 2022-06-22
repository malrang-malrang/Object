//
//  TicketSeller.swift
//  Object 1장
//
//  Created by 김동욱 on 2022/06/22.
//

import Foundation

//판매원이 매표소를 프로퍼티로 가지고 있다.
final class TicketSeller {
    private let ticketOffice: TicketOffice
    
    init(ticketOffice: TicketOffice) {
        self.ticketOffice = ticketOffice
    }
    
    func sellTo(audience: Audience) {
        //관람객한테 티켓을 판매한다.
        ticketOffice.sellTicketTo(audience: audience)
    }
}

//티켓 교환해주는곳 매표소
final class TicketOffice {
    private var tickets: [Ticket]
    private var amount: Int
    
    init(tickets: [Ticket], amount: Int) {
        self.tickets = tickets
        self.amount = amount
    }
    
    func sellTicketTo(audience: Audience) {
        plusAmount(amount: audience.buy(ticket: getTicket()))
    }
    
    //티켓을 판매하는 메서드
    func getTicket() -> Ticket {
        return self.tickets.removeFirst()
    }
    
    //금액을 더하는 메서드
    func plusAmount(amount: Int) {
        self.amount += amount
    }
}
