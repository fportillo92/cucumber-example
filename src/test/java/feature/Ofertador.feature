Feature: Call API Ofertador

  Background:request token
    * configure ssl = true
    * url tokenUrl
    * request {"grant_type":"client_credentials", "client_id":"client_microsoft", "client_secret":"client_microsoft_secret"}
    * method post
    * status 200
    * def accessToken = response.access_token

  Scenario: Schema Validation
    * url bannerHomePageUrl
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

  Scenario Outline: Multiple Placement
    * url <placement>
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
      | placement         | rut      | cardType   | cardAmount | saeAmount | aeAmount |
      | bannerHomePageUrl | 15027400 | visa       | 1235       | 0         | 220000   |
      | bannerHomePageUrl | 8000875  | visa       | 1235       | 0         | 15000000 |
      | bannerHomePageUrl | 9914194  | visa       | 1235       | 0         | 230000   |
      | bannerHomePageUrl | 12744682 | easy       | 1235       | 2390000   | 15000000 |
      | bannerHomePageUrl | 9453580  | jumbo      | 1235       | 410000    | 15000000 |
      | bannerHomePageUrl | 16335202 | paris      | 1235       | 0         | 15000000 |
      | bannerHomePageUrl | 14256306 | easy       | 1235       | 6280000   | 15000000 |
      | bannerHomePageUrl | 8816089  | mastercard | 1235       | 7280000   | 5000000  |
      | bannerHomePageUrl | 5152909  | visa       | 1235       | 2740000   | 760000   |
      | bannerHomePageUrl | 16145990 | cencosud   | 1235       | 0         | 340000   |
      | bannerHomePageUrl | 10004198 | paris      | 1235       | 0         | 15000000 |
      | bannerHomePageUrl | 10000007 | visa       | 1235       | 9940000   | 15000000 |
      | bannerHomePageUrl | 15827976 | visa       | 1235       | 10000000  | 1300000  |
      | bannerHomePageUrl | 8000688  | paris      | 1235       | 0         | 10000    |
      | bannerHomePageUrl | 15024536 | visa       | 1235       | 0         | 701000   |
      | bannerHomePageUrl | 8001357  | easy       | 1235       | 0         | 15000000 |
      | bannerHomePageUrl | 10001690 | paris      | 1235       | 5000000   | 15000000 |
      | succeedPageUrl    | 15027400 | visa       | 1235       | 0         | 220000   |
      | succeedPageUrl    | 8000875  | visa       | 1235       | 0         | 15000000 |
      | succeedPageUrl    | 9914194  | visa       | 1235       | 0         | 230000   |
      | succeedPageUrl    | 12744682 | easy       | 1235       | 2390000   | 15000000 |
      | succeedPageUrl    | 9453580  | jumbo      | 1235       | 410000    | 15000000 |
      | succeedPageUrl    | 16335202 | paris      | 1235       | 0         | 15000000 |
      | succeedPageUrl    | 14256306 | easy       | 1235       | 6280000   | 15000000 |
      | succeedPageUrl    | 8816089  | mastercard | 1235       | 7280000   | 5000000  |
      | succeedPageUrl    | 5152909  | visa       | 1235       | 2740000   | 760000   |
      | succeedPageUrl    | 16145990 | cencosud   | 1235       | 0         | 340000   |
      | succeedPageUrl    | 10004198 | paris      | 1235       | 0         | 15000000 |
      | succeedPageUrl    | 10000007 | visa       | 1235       | 9940000   | 15000000 |
      | succeedPageUrl    | 15827976 | visa       | 1235       | 10000000  | 1300000  |
      | succeedPageUrl    | 8000688  | paris      | 1235       | 0         | 10000    |
      | succeedPageUrl    | 15024536 | visa       | 1235       | 0         | 701000   |
      | succeedPageUrl    | 8001357  | easy       | 1235       | 0         | 15000000 |
      | succeedPageUrl    | 10001690 | paris      | 1235       | 5000000   | 15000000 |
      | accountResumeUrl  | 15027400 | visa       | 1235       | 0         | 220000   |
      | accountResumeUrl  | 8000875  | visa       | 1235       | 0         | 15000000 |
      | accountResumeUrl  | 9914194  | visa       | 1235       | 0         | 230000   |
      | accountResumeUrl  | 12744682 | easy       | 1235       | 2390000   | 15000000 |
      | accountResumeUrl  | 9453580  | jumbo      | 1235       | 410000    | 15000000 |
      | accountResumeUrl  | 16335202 | paris      | 1235       | 0         | 15000000 |
      | accountResumeUrl  | 14256306 | easy       | 1235       | 6280000   | 15000000 |
      | accountResumeUrl  | 8816089  | mastercard | 1235       | 7280000   | 5000000  |
      | accountResumeUrl  | 5152909  | visa       | 1235       | 2740000   | 760000   |
      | accountResumeUrl  | 16145990 | cencosud   | 1235       | 0         | 340000   |
      | accountResumeUrl  | 10004198 | paris      | 1235       | 0         | 15000000 |
      | accountResumeUrl  | 10000007 | visa       | 1235       | 9940000   | 15000000 |
      | accountResumeUrl  | 15827976 | visa       | 1235       | 10000000  | 1300000  |
      | accountResumeUrl  | 8000688  | paris      | 1235       | 0         | 10000    |
      | accountResumeUrl  | 15024536 | visa       | 1235       | 0         | 701000   |
      | accountResumeUrl  | 8001357  | easy       | 1235       | 0         | 15000000 |
      | accountResumeUrl  | 10001690 | paris      | 1235       | 5000000   | 15000000 |

  Scenario Outline: Datos variables
    * url bannerHomePageUrl
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
      | rut      | cardType   | cardAmount | saeAmount | aeAmount |
      | 17557918 | jumbo      | 1235       | 3970000   | 585048   |
      | 13444995 | cencosud   | 1235       | 3900000   | 100000   |
      | 10961526 | mastercard | 1235       | 0         | 0        |
      | 15765375 | paris      | 1235       | 0         | 0        |
      | 12247410 | paris      | 1235       | 0         | 0        |
      | 6131343  | mastercard | 1235       | 7800000   | 0        |
      | 18948844 | mastercard | 1235       | 0         | 0        |
      | 10004198 | mastercard | 1235       | 0         | 0        |
      | 4432091  | mastercard | 1235       | 0         | 0        |
      | 19192612 | mastercard | 1235       | 0         | 0        |
      | 12389283 | mastercard | 1235       | 1190000   | 350000   |
      | 8720307  | cencosud   | 1235       | 0         | 0        |
      | 18577224 | cencosud   | 1235       | 0         | 0        |
      | 15854342 | mastercard | 1235       | 4720000   | 256328   |
      | 8000306  | mastercard | 1235       | 7820000   | 1260000  |
      | 17853406 | mastercard | 1235       | 7820000   | 1260000  |
      | 8000533  | paris      | 1235       | 1660000   | 100000   |
      | 6879859  | mastercard | 1235       | 5540000   | 805000   |
      | 16300313 | mastercard | 1235       | 1020000   | 210000   |
      | 14515974 | visa       | 1235       | 15000000  | 4323827  |
      | 10477669 | cencosud   | 1235       | 0         | 0        |
      | 19174373 | mastercard | 1235       | 0         | 0        |
      | 13355476 | paris      | 1235       | 1470000   | 0        |
      | 10738935 | mastercard | 1235       | 2300000   | 321925   |
      | 17438834 | cencosud   | 1235       | 1260000   | 0        |
      | 14201085 | cencosud   | 1235       | 0         | 0        |
      | 5152909  | visa       | 1235       | 2740000   | 76000    |
      | 17139014 | cencosud   | 1235       | 0         | 0        |
      | 13919758 | paris      | 1235       | 3420000   | 50000    |
      | 8001276  | easy       | 1235       | 0         | 0        |
      | 13007525 | paris      | 1235       | 6500000   | 5564586  |
      | 5353774  | visa       | 1235       | 0         | 0        |
      | 15899101 | mastercard | 1235       | 0         | 0        |
      | 12030568 | paris      | 1235       | 270000    | 9600     |
      | 10000007 | visa       | 1235       | 9940000   | 4838     |
      | 19019625 | cencosud   | 1235       | 0         | 0        |
      | 8892942  | visa       | 1235       | 8850000   | 1019512  |
      | 19009747 | mastercard | 1235       | 0         | 0        |
      | 5611679  | jumbo      | 1235       | 0         | 0        |
      | 5200894  | paris      | 1235       | 25000000  | 9999999  |
      | 14098322 | mastercard | 1235       | 1450000   | 299960   |
      | 15827976 | visa       | 1235       | 10000000  | 4058     |
      | 17134262 | cencosud   | 1235       | 2030000   | 0        |
      | 12055726 | mastercard | 1235       | 2590000   | 720000   |
      | 8264696  | cencosud   | 1235       | 0         | 0        |


  Scenario Outline:: Sexo: F, Rango etario: 1
    * url 'https://api-interna.uat.rfsc.cencosud.cl:8443/api/v1.0/ofertador/banners/banner'
    * header Authorization = 'Bearer ' + accessToken
    * request {"rut" : '<rut>',"cardType"  : '<cardType>',"cardAmount"  : '<cardAmount>',"saeAmount"  : '<saeAmount>', "aeAmount"  : '<aeAmount>' }
    * method post
    * status 200
    * match varBanner
    Examples:
      | rut      | cardType | cardAmount | saeAmount | aeAmount |
      | 16335202 | paris    | 1235       | 0         | 15000000 |
      | 16145990 | cencosud | 1235       | 0         | 340000   |