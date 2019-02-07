function fn() {

  var protocol = 'https';
  var baseUrl ='://api-interna.uat.rfsc.cencosud.cl:';
  var port = '8443';

  var config = {
    tokenUrl: protocol + baseUrl + port +'/api/v1.0/sec/oauth2/token',
    bannerHomePageUrl:  protocol + baseUrl + port +'/api/v1.0/ofertador/banners/banner',
    succeedPageUrl: protocol + baseUrl + port +'/api/v1.0/ofertador/banners/paginadeexito',
    accountResumeUrl:  protocol + baseUrl + port +'/api/v1.0/ofertador/banners/resumendecuenta'
  };
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}