package com.codeharmony;

import com.retouch.Redeemtion;
import com.retouch.User;

import java.math.BigDecimal;

/**
 * Created by Aasiz on 6/2/2015.
 */
public class RetoucherPayout {
    String emailMessage = "Payment from 1hretouch!";
    BigDecimal amount;
    String note = "Thank you for your hard work on 1hretouch.";
    String receiverEmail;
    String redeemtionId;
    User retoucher;

    public RetoucherPayout(String emailMessage, String redeemtionId, String receiverEmail, String note, BigDecimal amount,User retoucher) {
        this.emailMessage = emailMessage;
        this.redeemtionId = redeemtionId;
        this.receiverEmail = receiverEmail;
        this.note = note;
        this.amount = amount;
        this.retoucher = retoucher;
    }

    public RetoucherPayout(Redeemtion red) {
        this.redeemtionId = red.getRedeemId();
        this.receiverEmail = red.getRetoucher().getPaypalAccount();
        this.amount = red.getAmount();
        this.retoucher = red.getRetoucher();
    }

    public String getEmailMessage() {
        return emailMessage;
    }

    public User getRetoucher() {
        return retoucher;
    }

    public String getRedeemtionId() {
        return redeemtionId;
    }

    public String getReceiverEmail() {
        return receiverEmail;
    }

    public String getNote() {
        return note;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    String getStringAmount(){
        return amount.toString();

    }
}
