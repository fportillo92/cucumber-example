Feature: Call API Ofertador

  Background:request token
    * configure ssl = true
    * url tokenUrl
    * request {"grant_type":"client_credentials", "client_id":"client_microsoft", "client_secret":"client_microsoft_secret"}
    * method post
    * status 200
    * def accessToken = response.access_token

  Scenario: Schema Validation
    * url uatOfertadorUrl
    * header Authorization = 'Bearer ' + accessToken
    * request {"rut" : "15027400","cardType"  : "visa","cardAmount"  : "1235","saeAmount"  : "0", "aeAmount"  : "220000" }
    * method post
    * status 200
    * match response ==
    """
    {
    "id": '#uuid',
    "eventId": '#uuid',
    "bannerCode": '#string',
    "imageUrl": '#string',
    "productName": '#string',
    "itemId": '#string',
    "text": {
        "header": '#string',
        "body": '#string',
        "footer": '#string'
    },
    "button": {
        "text": '#string',
        "link": '#string',
        "target": '#string'
    }
}
    """

  Scenario Outline:
    * url 'https://api-interna.uat.rfsc.cencosud.cl:8443/api/v1.0/ofertador/banners/banner'
    * header Authorization = 'Bearer ' + accessToken
    * request {"rut" : '<rut>',"cardType"  : '<cardType>',"cardAmount"  : '<cardAmount>',"saeAmount"  : '<saeAmount>', "aeAmount"  : '<aeAmount>' }
    * method post
    * status 200
    * def varImgUrl = read('varImgUrl.txt')
    * def varBannerCode = read ('varBannerCode.txt')
    * def varProductName = read ('varProductName.txt')
    * def varItemId = read ('varItemId.txt')
    * def varTextHeader = read ('varTextHeader.txt')
    * def varTextBody = read ('varTextBody.txt')
    * def varTextFooter = read ('varTextFooter.txt')
    * def varButtonText = read ('varButtonText.txt')
    * def varButtonLink = read ('varButtonLink.txt')
    * def varButtonTarget = read ('varButtonTarget.txt')
    * match varImgUrl contains response.imageUrl
    * match varBannerCode contains response.bannerCode
    * match varProductName contains response.productName
    * match varItemId contains response.itemId
    * match varTextHeader contains response.text.header
    * match varTextBody contains  response.text.body
    * match varTextFooter contains  response.text.footer
    * match varButtonText contains  response.button.text
    * match varButtonLink contains  response.button.link
    * match varButtonTarget contains  response.button.target
    Examples:
      | rut      | cardType | cardAmount | saeAmount | aeAmount |
      | 15027400 | visa     | 1235       | 0         | 220000   |
      | 8000875  | visa       | 1235       | 0         | 15000000 |
      | 9914194  | visa       | 1235       | 0         | 230000   |
      | 12744682 | easy       | 1235       | 2390000   | 15000000 |
      | 9453580  | jumbo      | 1235       | 410000    | 15000000 |
      | 16335202 | paris      | 1235       | 0         | 15000000 |
      | 14256306 | easy       | 1235       | 6280000   | 15000000 |
      | 8816089  | mastercard | 1235       | 7280000   | 5000000  |
      | 5152909  | visa       | 1235       | 2740000   | 760000   |
      | 16145990 | cencosud   | 1235       | 0         | 340000   |
      | 10004198 | paris      | 1235       | 0         | 15000000 |
      | 10000007 | visa       | 1235       | 9940000   | 15000000 |
      | 15827976 | visa       | 1235       | 10000000  | 1300000  |
      | 8000688  | paris      | 1235       | 0         | 10000    |
      | 15024536 | visa       | 1235       | 0         | 701000   |
      | 8001357  | easy       | 1235       | 0         | 15000000 |
      | 10001690 | paris      | 1235       | 5000000   | 15000000 |


