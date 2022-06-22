//
//  Audience.swift
//  Object 1장
//
//  Created by 김동욱 on 2022/06/22.
//

import Foundation

//관람객
final class Audience {
    //관람객이 소유한 가방
    private let bag: Bag
    
    init(bag: Bag) {
        self.bag = bag
    }
    
    func buy(ticket: Ticket) -> Int {
        return bag.hold(ticket: ticket)
    }
}

//관람객이 소유할 가방
final class Bag {
    // 가방에는 초대장, 티켓, 현금 을 가지고 있을수있다.
    private let invitation: Invitation?
    private var ticket: Ticket?
    private var amount: Int?
    
    // 초대장과 현금을 가지고 있는 경우
    init(invitation: Invitation, amount: Int) {
        self.invitation = invitation
        self.ticket = nil
        self.amount = amount
    }
    
    // 현금만 가지고 있는 경우
    init(amount: Int) {
        self.invitation = nil
        self.ticket = nil
        self.amount = amount
    }
    
    func hold(ticket: Ticket) -> Int {
        if hasInvitation() {
            setTicket(ticket: ticket)
            return .zero
        } else {
            setTicket(ticket: ticket)
            minusAmount(amount: ticket.getFee())
            return ticket.getFee()
        }
    }
    
    //초대장이 없다면 false
    func hasInvitation() -> Bool {
        return invitation != nil
    }
    
    //티켓을 교체
    func setTicket(ticket: Ticket) {
        self.ticket = ticket
    }
    
    //소유한 현찰 -
    func minusAmount(amount: Int) {
        self.amount! -= amount
    }
}

//관람객이 소유할 티켓
final class Ticket {
    private let fee: Int
    
    init(fee: Int) {
        self.fee = fee
    }
    
    func getFee() -> Int {
        return fee
    }
}


//초대장
final class Invitation {
    //초대 날짜
    private let when: Date
    
    init(when: Date) {
        self.when = when
    }
}
