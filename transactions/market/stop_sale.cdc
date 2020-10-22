import TopShot from 0xTOPSHOTADDRESS
import Market from 0xMARKETADDRESS

// This transaction is for a user to stop a moment sale in their account

// Parameters
//
// tokenID: the ID of the moment whose sale is to be delisted

transaction(tokenID: UInt64) {

    prepare(acct: AuthAccount) {

        // borrow a reference to the owner's sale collection
        let topshotSaleCollection = acct.borrow<&Market.SaleCollection>(from: Market.marketStoragePath)
            ?? panic("Could not borrow from sale in storage")

        // cancel the moment from the sale, thereby de-listing it
        topshotSaleCollection.cancelSale(tokenID: tokenID)
    }
}