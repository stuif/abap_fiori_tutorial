@AbapCatalog.sqlViewName: 'ZDEMO_SOI2'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'List Reporting for Sales Order Item'

define view ZDEMO_CDS_SalesOrderItem
  as select from SEPM_I_SalesOrderItem_E as Item
{
  key Item.SalesOrder                             as SalesOrderID,
  key Item.SalesOrderItem                         as ItemPosition,
      Item._SalesOrder._Customer.CompanyName      as CompanyName,
      Item.Product                                as Product,
      @Semantics.currencyCode: true
      Item.TransactionCurrency                    as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Item.GrossAmountInTransacCurrency           as GrossAmount,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Item.NetAmountInTransactionCurrency         as NetAmount,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Item.TaxAmountInTransactionCurrency         as TaxAmount,
      Item.ProductAvailabilityStatus              as ProductAvailabilityStatus
}
