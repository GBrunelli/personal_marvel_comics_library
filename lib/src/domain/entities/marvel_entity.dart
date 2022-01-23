abstract class MarvelEntity {

  MarvelEntity(this.id, this.thumbBaseUrl, this.imageExtension);
  String thumbBaseUrl;
  String imageExtension;
  int id;

  String get smallPortraitThumb => thumbBaseUrl + '/portrait_small.' + imageExtension;
  String get mediumPortraitThumb => thumbBaseUrl + '/portrait_medium.' + imageExtension;
  String get xlargePortraitThumb => thumbBaseUrl + '/portrait_xlarge.' + imageExtension;
  String get fantasticPortraitThumb => thumbBaseUrl + '/portrait_fantastic.' + imageExtension;
  String get uncannyPortraitThumb => thumbBaseUrl + '/portrait_uncanny.' + imageExtension;
  String get incrediblePortraitThumb => thumbBaseUrl + '/portrait_incredible.' + imageExtension;

  String get smallStandardThumb => thumbBaseUrl + '/standard_small.' + imageExtension;
  String get mediumStandardThumb => thumbBaseUrl + '/standard_medium.' + imageExtension;
  String get largeStandardThumb => thumbBaseUrl + '/standard_large.' + imageExtension;
  String get xlargeStandardThumb => thumbBaseUrl + '/standard_xlarge.' + imageExtension;
  String get fantasticStandardThumb => thumbBaseUrl + '/standard_fantastic.' + imageExtension;
  String get amazingStandardThumb => thumbBaseUrl + '/standard_amazing.' + imageExtension;

  String get smallLandscapeThumb => thumbBaseUrl + '/landscape_small.' + imageExtension;
  String get mediumLandscapeThumb => thumbBaseUrl + '/landscape_medium.' + imageExtension;
  String get largeLandscapeThumb => thumbBaseUrl + '/landscape_large.' + imageExtension;
  String get xlargeLandscapeThumb => thumbBaseUrl + '/landscape_xlarge.' + imageExtension;
  String get amazingLandscapeThumb => thumbBaseUrl + '/landscape_amazing.' + imageExtension;
  String get incredibleLandscapeThumb => thumbBaseUrl + '/landscape_incredible.' + imageExtension;

}