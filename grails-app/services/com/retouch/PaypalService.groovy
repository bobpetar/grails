package com.retouch

import grails.transaction.Transactional;
import com.paypal.api.payments.Currency;
import com.paypal.api.payments.Payout;
import com.paypal.api.payments.PayoutBatch;
import com.paypal.api.payments.PayoutItem;
import com.paypal.api.payments.PayoutSenderBatchHeader;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import com.paypal.base.rest.PayPalResource;
import com.paypal.api.payments.util.GenerateAccessToken;

@Transactional
class PaypalService {



    def massPay() {

    }


    public PayoutBatch createSynchronousSinglePayout() {
        // ###Payout
        // A resource representing a payout
        Payout payout = new Payout();

        PayoutSenderBatchHeader senderBatchHeader = new PayoutSenderBatchHeader();

        // ### NOTE:
        // You can prevent duplicate batches from being processed. If you
        // specify a `sender_batch_id` that was used in the last 30 days, the
        // batch will not be processed. For items, you can specify a
        // `sender_item_id`. If the value for the `sender_item_id` is a
        // duplicate of a payout item that was processed in the last 30 days,
        // the item will not be processed.
        // #### Batch Header Instance
        Random random = new Random();
        senderBatchHeader.setSenderBatchId(
                new Double(random.nextDouble()).toString()).setEmailSubject(
                "You have a Payout!");

        // ### Currency
        Currency amount = new Currency();
        amount.setValue("1.00").setCurrency("USD");

        // #### Sender Item
        // Please note that if you are using single payout with sync mode, you
        // can only pass one Item in the request
        PayoutItem senderItem = new PayoutItem();
        senderItem.setRecipientType("Email")
                .setNote("Thanks for your patronage")
                .setReceiver("shirt-supplier-one@gmail.com")
                .setSenderItemId("201404324234").setAmount(amount);

        List<PayoutItem> items = new ArrayList<PayoutItem>();
        items.add(senderItem);

        payout.setSenderBatchHeader(senderBatchHeader).setItems(items);

        PayoutBatch batch = null;
        try {

            // ###AccessToken
            // Retrieve the access token from
            // OAuthTokenCredential by passing in
            // ClientID and ClientSecret
            // It is not mandatory to generate Access Token on a per call basis.
            // Typically the access token can be generated once and
            // reused within the expiry window
            String accessToken = GenerateAccessToken.getAccessToken();

            // ### Api Context
            // Pass in a `ApiContext` object to authenticate
            // the call and to send a unique request id
            // (that ensures idempotency). The SDK generates
            // a request id if you do not pass one explicitly.
            APIContext apiContext = new APIContext(accessToken);
            // Use this variant if you want to pass in a request id
            // that is meaningful in your application, ideally
            // a order id.
            /*
             * String requestId = Long.toString(System.nanoTime(); APIContext
             * apiContext = new APIContext(accessToken, requestId ));
             */

            // ###Create Payout Synchronous
            batch = payout.createSynchronous(apiContext);

           /* LOGGER.info("Payout Batch With ID: "
                    + batch.getBatchHeader().getPayoutBatchId());
            ResultPrinter.addResult(req, resp,
                    "Created Single Synchronous Payout",
                    Payout.getLastRequest(), Payout.getLastResponse(), null);*/
        } catch (PayPalRESTException e) {
           /* ResultPrinter.addResult(req, resp,
                    "Created Single Synchronous Payout",
                    Payout.getLastRequest(), null, e.getMessage());*/
        }
        return batch;
    }
}
