# Dough

An experimental Flutter currency convertor app for Android and iOS.

![Made With Flutter](https://img.shields.io/badge/-Made%20With%20Flutter-informational?style=flat&logo=flutter)
<!--![GitHub](https://img.shields.io/github/license/jurgenizer/dough?style=flat-square)--> 
[![Codemagic build status](https://api.codemagic.io/apps/5ee33fa0ac4999001507a6f8/5ee396064d6c121f23d2c7dc/status_badge.svg)](https://codemagic.io/apps/5ee33fa0ac4999001507a6f8/5ee396064d6c121f23d2c7dc/latest_build)

<div>
<a href='https://play.google.com/store/apps/details?id=com.jurgengeitner.dough'><img alt='Get it on Google Play' src='github_assets/google-play-badge.png' height='48px'/></a>
<a href='https://apps.apple.com/za/app/dough/id1517412538'><img alt='Get it on the App Store' src='github_assets/apple-app-store-badge.png' height='48px'/></a>
</div>

I built this design study to explore neumorphism and improve my Flutter development skills.
The core code and architechture are based on this very good provider state management [tutorial](https://www.raywenderlich.com/6373413-state-management-with-provider) by Jonathan at [raywenderlich.com](https://www.raywenderlich.com). I added the circular slider and a little bit of neumorphism.

<img src="github_assets/screenshot-1.png" width="25%" /> <img src="github_assets/screenshot-2.png" width="25%" />

Thank you to [Idean](https://www.idean.com/) for the Flutter-Neumorphic package, available [here](https://pub.dev/packages/flutter_neumorphic).

Exchange rate api provided by [https://exchangeratesapi.io/](https://exchangeratesapi.io/) - much appreciated, thank you!

Hat-tip also to [David Anaya](https://github.com/davidanaya/flutter-circular-slider) for the neat Flutter Circular Slider [package](https://pub.dev/packages/flutter_circular_slider).

### TODO
* Move some widgets out of calculate_screen.dart. There is way too much going in there, [pyramids of doom](https://en.wikipedia.org/wiki/Pyramid_of_doom_(programming)) etc.
* Fix my janky code.

### License

[MIT](https://github.com/jurgenizer/dough/blob/master/LICENSE)
