export default function () {
  function getSearchFields(saleOrRental) {
    // will eventually get this from the server
    let priceFromFieldName = "forSalePriceFrom"
    let priceTillFieldName = "forSalePriceTill"
    let priceFromOptions = [
      "25,000",
      "50,000",
      "100,000",
      "250,000",
      "500,000",
      "1,000,000",
      "2,500,000",
      "5,000,000",
      "10,000,000",
      "25,000,000"
    ]
    let priceTillOptions = [
      "50,000",
      "100,000",
      "250,000",
      "500,000",
      "1,000,000",
      "2,500,000",
      "5,000,000",
      "10,000,000",
      "25,000,000",
      "50,000,000",
    ]
    if (saleOrRental === "rental") {
      priceTillFieldName = "forRentPriceTill"
      priceFromFieldName = "forRentPriceFrom"
      priceFromOptions = [
        "50",
        "100",
        "250",
        "500",
        "1,000",
        "2,500",
        "5,000",
        "10,000",
        "25,000"
      ]
      priceTillOptions = [
        "250",
        "500",
        "1,000",
        "2,500",
        "5,000",
        "10,000",
        "25,000",
        "50,000"
      ]
    }
    return [
      {
        "toggleOnMobile": false,
        "labelTextTKey": "simple_form.labels.search.for_sale_price_from",
        "classNames": "xs12 sm4 lg3",
        "tooltipTextTKey": "",
        "fieldName": priceFromFieldName,
        "queryStringName": "price_min",
        "inputType": "priceText",
        "defaultValueForAlert": "50000",
        "defaultValueForSearch": "50000",
        "sortOrder": 3,
        "currencyPrefix": "€",
        "optionsValues": priceFromOptions
      },
      {
        "toggleOnMobile": true,
        "labelTextTKey": "simple_form.labels.search.for_sale_price_till",
        "classNames": "xs12 sm4 lg3",
        "tooltipTextTKey": "",
        "fieldName": priceTillFieldName,
        "queryStringName": "price_max",
        "inputType": "priceText",
        "defaultValueForAlert": "5000000",
        "defaultValueForSearch": "10000000",
        "sortOrder": 4,
        "currencyPrefix": "€",
        "optionsValues": priceTillOptions
      },
      {
        "toggleOnMobile": true,
        // "labelTextTKey": "client_shared.fieldLabels.minBedrooms",
        "labelTextTKey": "simple_form.labels.search.count_bedrooms",
        "classNames": "xs12 sm4 lg3",
        "tooltipTextTKey": "",
        "fieldName": "bedroomsFrom",
        "queryStringName": "bedrooms_min",
        "defaultValueForSearch": "0",
        "defaultValueForAlert": "2",
        "inputType": "counter",
        "sortOrder": 8,
        "optionsValues": [
          "0",
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9",
          "10",
          "11",
          "12",
          "13",
          "14",
          "15",
          "16",
          "17",
          "18",
          "19",
          "20",
        ]
      },
      {
        "toggleOnMobile": true,
        "labelTextTKey": "simple_form.labels.search.count_bathrooms",
        "classNames": "xs12 sm4 lg3",
        "tooltipTextTKey": "",
        "fieldName": "bathroomsFrom",
        "queryStringName": "bathrooms_min",
        "defaultValueForSearch": "0",
        "defaultValueForAlert": "1",
        "inputType": "counter",
        "sortOrder": 9,
        "optionsValues": [
          "0",
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9",
          "10",
          "11",
          "12",
          "13",
          "14",
          "15",
          "16",
          "17",
          "18",
          "19",
          "20",
        ]
      }
    ]
  }
  return {
    getSearchFields
  }
}