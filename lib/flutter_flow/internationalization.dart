import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr', 'ar', 'sw'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
    String? arText = '',
    String? swText = '',
  }) =>
      [enText, esText, frText, arText, swText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Start
  {
    'ogc6h2r9': {
      'en': 'Welcome.',
      'ar': 'مرحباً.',
      'es': 'Bienvenido.',
      'fr': 'Accueillir.',
      'sw': 'Karibu.',
    },
    '4iq7slee': {
      'en':
          'Discover the rich tapestry of  African art delivered to your doorstep!',
      'ar':
          'اكتشف الأطعمة الطازجة التي يتم توصيلها مباشرة من المزارعين المحليين إلى باب منزلك!',
      'es':
          '¡Descubra la comida más fresca, entregada directamente por los agricultores locales a su puerta!',
      'fr':
          'Découvrez les aliments les plus frais, livrés directement par les agriculteurs locaux à votre porte !',
      'sw':
          'Gundua chakula kipya zaidi, kinacholetwa moja kwa moja kutoka kwa wakulima wa ndani hadi mlangoni pako!',
    },
    'ged41go0': {
      'en': 'Welcome.',
      'ar': 'مرحباً.',
      'es': 'Bienvenido.',
      'fr': 'Accueillir.',
      'sw': 'Karibu.',
    },
    'b3rg1k23': {
      'en':
          'Discover the rich tapestry of  African art delivered to your doorstep!',
      'ar':
          'اكتشف الأطعمة الطازجة التي يتم توصيلها مباشرة من المزارعين المحليين إلى باب منزلك!',
      'es':
          '¡Descubra la comida más fresca, entregada directamente por los agricultores locales a su puerta!',
      'fr':
          'Découvrez les aliments les plus frais, livrés directement par les agriculteurs locaux à votre porte !',
      'sw':
          'Gundua chakula kipya zaidi, kinacholetwa moja kwa moja kutoka kwa wakulima wa ndani hadi mlangoni pako!',
    },
    '2g8gfwix': {
      'en': 'Welcome.',
      'ar': 'مرحباً.',
      'es': 'Bienvenido.',
      'fr': 'Accueillir.',
      'sw': 'Karibu.',
    },
    'gf0cozt6': {
      'en':
          'Discover the rich tapestry of  African art delivered to your doorstep!',
      'ar':
          'اكتشف الأطعمة الطازجة التي يتم توصيلها مباشرة من المزارعين المحليين إلى باب منزلك.',
      'es':
          'Descubra la comida más fresca, entregada directamente por los agricultores locales a su puerta.',
      'fr':
          'Découvrez les aliments les plus frais, livrés directement par les agriculteurs locaux à votre porte.',
      'sw':
          'Gundua chakula kipya zaidi, kinacholetwa moja kwa moja kutoka kwa wakulima wa ndani hadi mlangoni pako.',
    },
    'ieysq8ov': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // LoginMethod
  {
    'k0nviovj': {
      'en': 'Let’s get you in',
      'ar': 'دعنا ندخلك',
      'es': 'Vamos a entrar',
      'fr': 'Laissez-vous entrer',
      'sw': 'Hebu tuingize ndani',
    },
    'xoym072d': {
      'en': 'Sign in with Google',
      'ar': 'الدخول مع جوجل',
      'es': 'Inicia sesión con Google',
      'fr': 'Connectez-vous avec Google',
      'sw': 'Ingia kwa kutumia Google',
    },
    'yprnjbub': {
      'en': 'or',
      'ar': 'أو',
      'es': 'o',
      'fr': 'ou',
      'sw': 'au',
    },
    'oudo6rps': {
      'en': 'Sign in with email',
      'ar': 'قم بتسجيل الدخول باستخدام البريد الإلكتروني',
      'es': 'Iniciar sesión con correo electrónico',
      'fr': 'Connectez-vous avec e-mail',
      'sw': 'Ingia kwa kutumia barua pepe',
    },
    'xauqkdx9': {
      'en': 'Don’t have an account?',
      'ar': 'ليس لديك حساب؟',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
      'sw': 'Je, huna akaunti?',
    },
    'pqomncy5': {
      'en': '  Sign up',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'sw': 'Jisajili',
    },
    'tdtto5un': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // OnBoarding
  {
    'i74467xr': {
      'en': 'Explore and Purchase',
      'ar': 'سهولة التسوق',
      'es': 'Compras fáciles',
      'fr': 'Achats faciles',
      'sw': 'Ununuzi rahisi',
    },
    'lc4263su': {
      'en':
          'Browse our curated collection and enjoy a secure, easy checkout. Every purchase directly supports the artist, helping them continue their creative journey.',
      'ar':
          'استكشف مجموعتنا المختارة، وقم بتقديم طلبك، واحصل على المنتجات الطازجة التي يتم توصيلها إلى باب منزلك. تضمن E-Soko أفضل جودة وأسعار عادلة للجميع.',
      'es':
          'Explore nuestra selección, haga su pedido y reciba productos frescos en la puerta de su casa. E-Soko garantiza la mejor calidad y precios justos para todos.',
      'fr':
          'Découvrez notre sélection, passez votre commande et recevez des produits frais livrés à votre porte. E-Soko garantit la meilleure qualité et des prix équitables pour tous.',
      'sw':
          'Gundua chaguo letu, agiza, na uletewe bidhaa mpya mlangoni pako. E-Soko inahakikisha ubora na bei nzuri kwa wote.',
    },
    '7hqn9soo': {
      'en': 'Support and Engage',
      'ar': 'طازجة من المزرعة',
      'es': 'Recién salido de la granja',
      'fr': 'Frais de la ferme',
      'sw': 'Safi kutoka shambani',
    },
    'tnxo13x1': {
      'en':
          'Be part of a community that empowers African artists. Share your favorite pieces, leave reviews, and connect with artists to foster a vibrant creative environment.',
      'ar':
          'تسوق بكل سهولة! حدد العناصر الخاصة بك، وقم بتقديم طلب، وسيتم توصيلها مباشرة إلى منزلك. طعام طازج، خالي من المتاعب.',
      'es':
          '¡Compre con facilidad! Seleccione sus artículos, haga un pedido y recíbalo directamente en su casa. Comida fresca y sin complicaciones.',
      'fr':
          'Achetez en toute simplicité ! Sélectionnez vos articles, passez commande et faites-vous livrer directement à votre domicile. Des aliments frais, sans tracas.',
      'sw':
          'Nunua kwa urahisi! Chagua bidhaa zako, agiza na uletewe moja kwa moja hadi nyumbani kwako. Chakula safi, bila shida.',
    },
    '39yd2a4n': {
      'en': 'Custom Commissions',
      'ar': 'دعم المزارعين المحليين',
      'es': 'Apoyar a los agricultores locales',
      'fr': 'Soutenir les agriculteurs locaux',
      'sw': 'Saidia wakulima wa ndani',
    },
    'wwlz7lve': {
      'en':
          'Bring your vision to life with custom artwork. Collaborate with our talented artists to create a unique piece tailored to your preferences.',
      'ar':
          'من خلال التسوق مع E-Soko، فإنك تدعم المزارعين المحليين والزراعة المستدامة. سجل الآن وأحدث تأثيرًا إيجابيًا مع كل عملية شراء!',
      'es':
          'Al comprar en E-Soko, apoya a los agricultores locales y la agricultura sostenible. ¡Regístrese ahora y genere un impacto positivo con cada compra!',
      'fr':
          'En faisant vos achats avec E-Soko, vous soutenez les agriculteurs locaux et l\'agriculture durable. Inscrivez-vous maintenant et ayez un impact positif à chaque achat !',
      'sw':
          'Kwa kufanya ununuzi na E-Soko, unasaidia wakulima wa ndani na kilimo endelevu. Jisajili sasa na ufanye matokeo chanya kwa kila ununuzi!',
    },
    'ztazuz7n': {
      'en': 'Skip',
      'ar': 'يتخطى',
      'es': 'Saltar',
      'fr': 'Sauter',
      'sw': 'Ruka',
    },
    '07geo164': {
      'en': 'Explore and Purchase',
      'ar': 'سهولة التسوق',
      'es': 'Compras fáciles',
      'fr': 'Achats faciles',
      'sw': 'Ununuzi rahisi',
    },
    '3knytz9d': {
      'en':
          'Browse our curated collection and enjoy a secure, easy checkout. Every purchase directly supports the artist, helping them continue their creative journey.',
      'ar':
          'استكشف مجموعتنا المختارة، وقم بتقديم طلبك، واحصل على المنتجات الطازجة التي يتم توصيلها إلى باب منزلك. تضمن E-Soko أفضل جودة وأسعار عادلة للجميع.',
      'es':
          'Explore nuestra selección, haga su pedido y reciba productos frescos en la puerta de su casa. E-Soko garantiza la mejor calidad y precios justos para todos.',
      'fr':
          'Découvrez notre sélection, passez votre commande et recevez des produits frais livrés à votre porte. E-Soko garantit la meilleure qualité et des prix équitables pour tous.',
      'sw':
          'Gundua chaguo letu, agiza, na uletewe bidhaa mpya mlangoni pako. E-Soko inahakikisha ubora na bei nzuri kwa wote.',
    },
    'g1a4r1in': {
      'en': 'Support and Engage',
      'ar': 'طازجة من المزرعة',
      'es': 'Recién salido de la granja',
      'fr': 'Frais de la ferme',
      'sw': 'Safi kutoka shambani',
    },
    'n38pbffk': {
      'en':
          'Be part of a community that empowers African artists. Share your favorite pieces, leave reviews, and connect with artists to foster a vibrant creative environment.',
      'ar':
          'تسوق بكل سهولة! حدد العناصر الخاصة بك، وقم بتقديم طلب، وسيتم توصيلها مباشرة إلى منزلك. طعام طازج، خالي من المتاعب.',
      'es':
          '¡Compre con facilidad! Seleccione sus artículos, haga un pedido y recíbalo directamente en su casa. Comida fresca y sin complicaciones.',
      'fr':
          'Achetez en toute simplicité ! Sélectionnez vos articles, passez commande et faites-vous livrer directement à votre domicile. Des aliments frais, sans tracas.',
      'sw':
          'Nunua kwa urahisi! Chagua bidhaa zako, agiza na uletewe moja kwa moja hadi nyumbani kwako. Chakula safi, bila shida.',
    },
    'dkojy6h8': {
      'en': 'Custom Commissions',
      'ar': 'دعم المزارعين المحليين',
      'es': 'Apoyar a los agricultores locales',
      'fr': 'Soutenir les agriculteurs locaux',
      'sw': 'Saidia wakulima wa ndani',
    },
    'zip2qnyc': {
      'en':
          'Bring your vision to life with custom artwork. Collaborate with our talented artists to create a unique piece tailored to your preferences.',
      'ar':
          'من خلال التسوق مع E-Soko، فإنك تدعم المزارعين المحليين والزراعة المستدامة. سجل الآن وأحدث تأثيرًا إيجابيًا مع كل عملية شراء!',
      'es':
          'Al comprar en E-Soko, apoya a los agricultores locales y la agricultura sostenible. ¡Regístrese ahora y genere un impacto positivo con cada compra!',
      'fr':
          'En faisant vos achats avec E-Soko, vous soutenez les agriculteurs locaux et l\'agriculture durable. Inscrivez-vous maintenant et ayez un impact positif à chaque achat !',
      'sw':
          'Kwa kufanya ununuzi na E-Soko, unasaidia wakulima wa ndani na kilimo endelevu. Jisajili sasa na ufanye matokeo chanya kwa kila ununuzi!',
    },
    'ikoqbna0': {
      'en': 'Skip',
      'ar': 'يتخطى',
      'es': 'Saltar',
      'fr': 'Sauter',
      'sw': 'Ruka',
    },
    'cl1kaywu': {
      'en': 'Explore and Purchase',
      'ar': 'سهولة التسوق',
      'es': 'Compras fáciles',
      'fr': 'Achats faciles',
      'sw': 'Ununuzi rahisi',
    },
    'dpl2fnt8': {
      'en':
          'Browse our curated collection and enjoy a secure, easy checkout. Every purchase directly supports the artist, helping them continue their creative journey.',
      'ar':
          'استكشف مجموعتنا المختارة، وقم بتقديم طلبك، واحصل على المنتجات الطازجة التي يتم توصيلها إلى باب منزلك. تضمن E-Soko أفضل جودة وأسعار عادلة للجميع.',
      'es':
          'Explore nuestra selección, haga su pedido y reciba productos frescos en la puerta de su casa. E-Soko garantiza la mejor calidad y precios justos para todos.',
      'fr':
          'Découvrez notre sélection, passez votre commande et recevez des produits frais livrés à votre porte. E-Soko garantit la meilleure qualité et des prix équitables pour tous.',
      'sw':
          'Gundua chaguo letu, agiza, na uletewe bidhaa mpya mlangoni pako. E-Soko inahakikisha ubora na bei nzuri kwa wote.',
    },
    '2drvuhmg': {
      'en': 'Support and Engage',
      'ar': 'طازجة من المزرعة',
      'es': 'Recién salido de la granja',
      'fr': 'Frais de la ferme',
      'sw': 'Safi kutoka shambani',
    },
    'ia05q057': {
      'en':
          'Be part of a community that empowers African artists. Share your favorite pieces, leave reviews, and connect with artists to foster a vibrant creative environment.',
      'ar':
          'من خلال التسوق مع E-Soko، فإنك تدعم المزارعين المحليين والزراعة المستدامة. سجل الآن وأحدث تأثيرًا إيجابيًا مع كل عملية شراء!',
      'es':
          'Al comprar en E-Soko, apoya a los agricultores locales y la agricultura sostenible. ¡Regístrese ahora y genere un impacto positivo con cada compra!',
      'fr':
          'En faisant vos achats avec E-Soko, vous soutenez les agriculteurs locaux et l\'agriculture durable. Inscrivez-vous maintenant et ayez un impact positif à chaque achat !',
      'sw':
          'Kwa kufanya ununuzi na E-Soko, unasaidia wakulima wa ndani na kilimo endelevu. Jisajili sasa na ufanye matokeo chanya kwa kila ununuzi!',
    },
    '5q5cik48': {
      'en': 'Custom Commissions',
      'ar': 'دعم المزارعين المحليين',
      'es': 'Apoyar a los agricultores locales',
      'fr': 'Soutenir les agriculteurs locaux',
      'sw': 'Saidia wakulima wa ndani',
    },
    'itak83uc': {
      'en':
          'Bring your vision to life with custom artwork. Collaborate with our talented artists to create a unique piece tailored to your preferences.',
      'ar':
          'من خلال التسوق مع E-Soko، فإنك تدعم المزارعين المحليين والزراعة المستدامة. سجل الآن وأحدث تأثيرًا إيجابيًا مع كل عملية شراء!',
      'es':
          'Al comprar en E-Soko, apoya a los agricultores locales y la agricultura sostenible. ¡Regístrese ahora y genere un impacto positivo con cada compra!',
      'fr':
          'En faisant vos achats avec E-Soko, vous soutenez les agriculteurs locaux et l\'agriculture durable. Inscrivez-vous maintenant et ayez un impact positif à chaque achat !',
      'sw':
          'Kwa kufanya ununuzi na E-Soko, unasaidia wakulima wa ndani na kilimo endelevu. Jisajili sasa na ufanye matokeo chanya kwa kila ununuzi!',
    },
    'hus0pjk0': {
      'en': 'Skip',
      'ar': 'يتخطى',
      'es': 'Saltar',
      'fr': 'Sauter',
      'sw': 'Ruka',
    },
    '3tja30tz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Login
  {
    'ze3m37np': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'sw': 'Ingia',
    },
    'm5qo8hnd': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'eefxbplv': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'yikxp0nv': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '7v52ifuz': {
      'en': 'Remember me',
      'ar': 'تذكرنى',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
      'sw': 'Nikumbuke',
    },
    'nflzaz0l': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'sw': 'Weka sahihi',
    },
    '1d0ycpt5': {
      'en': 'Forgot the password?',
      'ar': 'هل نسيت كلمة المرور؟',
      'es': '¿Olvidaste la contraseña?',
      'fr': 'Vous avez oublié le mot de passe ?',
      'sw': 'Umesahau nenosiri?',
    },
    'vpd2uinh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'cf6o6r5k': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'sapcnpa8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'qhxn38kh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'w1zmrs5c': {
      'en': 'Don’t have an account?',
      'ar': 'ليس لديك حساب؟',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
      'sw': 'Je, huna akaunti?',
    },
    '64p75hm8': {
      'en': '   Sign up',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'sw': 'Jisajili',
    },
    'pspy3emu': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'sw': 'Ingia',
    },
    'oh9swbkb': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'd0rhpyjv': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'w5b5s9qo': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '735ncl8j': {
      'en': 'Remember me',
      'ar': 'تذكرنى',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
      'sw': 'Nikumbuke',
    },
    'uo7tnbsi': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'sw': 'Weka sahihi',
    },
    '7mse0knh': {
      'en': 'Forgot the password?',
      'ar': 'هل نسيت كلمة المرور؟',
      'es': '¿Olvidaste la contraseña?',
      'fr': 'Vous avez oublié le mot de passe ?',
      'sw': 'Umesahau nenosiri?',
    },
    '4ekxafjp': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'sjqvwzeu': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'wuz1kp5a': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    '8mls8xgr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'akn7m5re': {
      'en': 'Don’t have an account?',
      'ar': 'ليس لديك حساب؟',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
      'sw': 'Je, huna akaunti?',
    },
    'mynpx5gq': {
      'en': '   Sign up',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'sw': 'Jisajili',
    },
    't312y3jm': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'sw': 'Ingia',
    },
    'rnhtnff8': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'eosbeduu': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '1vhm6g9q': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'yr0c5j83': {
      'en': 'Remember me',
      'ar': 'تذكرنى',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
      'sw': 'Nikumbuke',
    },
    'thg5yqot': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'sw': 'Weka sahihi',
    },
    'zgduk5qu': {
      'en': 'Forgot the password?',
      'ar': 'هل نسيت كلمة المرور؟',
      'es': '¿Olvidaste la contraseña?',
      'fr': 'Vous avez oublié le mot de passe ?',
      'sw': 'Umesahau nenosiri?',
    },
    'jc24qt69': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'v2wc6j0o': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '2a23tco4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'fr3aoyz2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'u2qa1m1y': {
      'en': 'Don’t have an account?',
      'ar': 'ليس لديك حساب؟',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
      'sw': 'Je, huna akaunti?',
    },
    '2iqq1n9h': {
      'en': '   Sign up',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'sw': 'Jisajili',
    },
    'f4f5yys3': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // onBoard_Profile
  {
    '91bw3rji': {
      'en': 'Complete Your Profile',
      'ar': 'أكمل ملفك الشخصي',
      'es': 'Completa tu perfil',
      'fr': 'Complète ton profil',
      'sw': 'Kamilisha Wasifu Wako',
    },
    '0j9b3tya': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
      'sw': 'Jina kamili',
    },
    '6pd5svw3': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
      'sw': 'Jina la mtumiaji',
    },
    'jkvasdhi': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'z7pfbcwu': {
      'en': '+254750790128',
      'ar': '+13025079012',
      'es': '+13025079012',
      'fr': '+13025079012',
      'sw': '+13025079012',
    },
    'wkhri8fk': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
      'sw': 'Mwanaume',
    },
    'oaisacjy': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
      'sw': 'Kike',
    },
    'r08pyo3b': {
      'en': 'Other',
      'ar': 'آخر',
      'es': 'Otro',
      'fr': 'Autre',
      'sw': 'Nyingine',
    },
    'tmuiwm99': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
      'sw': 'Jinsia',
    },
    '5n8x2g4l': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'sw': 'Tafuta kipengee...',
    },
    '9dyjpeqh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'x0bohqc8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'ndlygltm': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    '64m1o5fr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'qemubkgi': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    '3tzewo4c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'b1bjuo7w': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    '2qey04bw': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'qpeypoks': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
      'sw': 'Endelea',
    },
    'lnb8l6m1': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // ForgotPass
  {
    '77w38e6m': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
      'sw': 'Umesahau nywila',
    },
    '8xwi23a0': {
      'en': 'Select which contact details should we use to reset your password',
      'ar':
          'حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك',
      'es':
          'Seleccione qué datos de contacto debemos utilizar para restablecer su contraseña',
      'fr':
          'Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe',
      'sw':
          'Chagua ni maelezo gani ya mawasiliano tunapaswa kutumia kuweka upya nenosiri lako',
    },
    'ax3mwrz0': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    '0lpnh5xu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    '0qht8p3m': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '11bg6jt3': {
      'en': 'Select which contact details should we use to reset your password',
      'ar':
          'حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك',
      'es':
          'Seleccione qué datos de contacto debemos utilizar para restablecer su contraseña',
      'fr':
          'Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe',
      'sw':
          'Chagua ni maelezo gani ya mawasiliano tunapaswa kutumia kuweka upya nenosiri lako',
    },
    '0w0bcik1': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    '1eyd09a2': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'n5dia5r0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    're9lfyww': {
      'en': 'Select which contact details should we use to reset your password',
      'ar':
          'حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك',
      'es':
          'Seleccione qué datos de contacto debemos utilizar para restablecer su contraseña',
      'fr':
          'Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe',
      'sw':
          'Chagua ni maelezo gani ya mawasiliano tunapaswa kutumia kuweka upya nenosiri lako',
    },
    'nh6dj66y': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'rp50w534': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'qf4zm582': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '8nrbmp0g': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
      'sw': 'Endelea',
    },
    'm4h4jnz9': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
      'sw': 'Endelea',
    },
    '42pnql6x': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Home
  {
    'p27evm8c': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'sw': 'Tafuta',
    },
    'lbdslgd2': {
      'en': 'Special Offers',
      'ar': 'عروض خاصة',
      'es': 'Ofertas especiales',
      'fr': 'Offres spéciales',
      'sw': 'Matoleo Maalum',
    },
    '01ug56a5': {
      'en': 'See All',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
      'sw': 'Ona yote',
    },
    '3sij1y1o': {
      'en': 'See All',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
      'sw': 'Ona yote',
    },
    'o4957ied': {
      'en': 'Paintings',
      'ar': 'حبوب ذرة',
      'es': 'Maíz',
      'fr': 'Maïs',
      'sw': 'Mahindi',
    },
    '9go13jj7': {
      'en': 'Digital Art',
      'ar': 'أرز',
      'es': 'Arroz',
      'fr': 'Riz',
      'sw': 'Mchele',
    },
    'aszp23yf': {
      'en': 'Most Popular',
      'ar': 'الأكثر شعبية',
      'es': 'Más popular',
      'fr': 'Le plus populaire',
      'sw': 'Maarufu sana',
    },
    'ipp5knbn': {
      'en': 'See All',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
      'sw': 'Ona yote',
    },
    '0skwsop6': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'c9kfadko': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
      'sw': 'Nguo',
    },
    'unlzowsm': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
      'sw': 'Viatu',
    },
    '06oiemum': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
      'sw': 'Nyumba',
    },
    'uruostoc': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'ng3f0im0': {
      'en': 'Hot Items',
      'ar': 'العناصر الساخنة',
      'es': 'Artículos calientes',
      'fr': 'Articles chauds',
      'sw': 'Vitu vya Moto',
    },
    'q2qulga1': {
      'en': 'See All',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
      'sw': 'Ona yote',
    },
    'dxm0v6yd': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    '3olt7l6r': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
      'sw': 'Nguo',
    },
    'ro50qw2v': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
      'sw': 'Viatu',
    },
    '718h6d44': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
      'sw': 'Nyumba',
    },
    'pwhldtcf': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'xtinlnl2': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'sw': 'Tafuta',
    },
    'mqvueu06': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Cart
  {
    'conyjoum': {
      'en': 'Cart',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'm0wx4dh4': {
      'en': 'Cart',
      'ar': 'عربة التسوق',
      'es': 'Carro',
      'fr': 'Chariot',
      'sw': 'Mkokoteni',
    },
  },
  // Notifications
  {
    '03vq7asq': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'es': 'Notificaciones',
      'fr': 'Notifications',
      'sw': 'Arifa',
    },
    'gnsmzrop': {
      'en': 'New',
      'ar': 'جديد',
      'es': 'Nuevo',
      'fr': 'Nouveau',
      'sw': 'Mpya',
    },
    'z5cmvjlf': {
      'en': 'Seen',
      'ar': 'مرئي',
      'es': 'Visto',
      'fr': 'Vu',
      'sw': 'Imeonekana',
    },
    'mk8tsw4k': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // wishlist
  {
    'eh0ixqg8': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // SpecialOffers
  {
    'h7pm8ha0': {
      'en': 'Special Offers',
      'ar': 'عروض خاصة',
      'es': 'Ofertas especiales',
      'fr': 'Offres spéciales',
      'sw': 'Matoleo Maalum',
    },
    'drtfgb0f': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Products
  {
    'j4ql5ja1': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'cbrfrqgs': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
      'sw': 'Nguo',
    },
    'ep1xdj7s': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
      'sw': 'Viatu',
    },
    'tzt6shbw': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
      'sw': 'Nyumba',
    },
    '8upw0qut': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Search
  {
    '0qzixbfu': {
      'en': 'Search in products',
      'ar': 'البحث في المنتجات',
      'es': 'Buscar en productos',
      'fr': 'Rechercher dans les produits',
      'sw': 'Tafuta katika bidhaa',
    },
    'j78klw2g': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'sw': 'Tafuta',
    },
    '2i311bt7': {
      'en': 'Clear',
      'ar': 'واضح',
      'es': 'Claro',
      'fr': 'Clair',
      'sw': 'Wazi',
    },
    'u2ud0w1d': {
      'en': 'Recent',
      'ar': 'مؤخرًا',
      'es': 'Reciente',
      'fr': 'Récent',
      'sw': 'Hivi karibuni',
    },
    'fovdu1w3': {
      'en': 'Clear All',
      'ar': 'امسح الكل',
      'es': 'Limpiar todo',
      'fr': 'Tout effacer',
      'sw': 'Futa Zote',
    },
    'ja6kvgid': {
      'en': 'Set Silter',
      'ar': 'تعيين سيلتر',
      'es': 'Establecer filtro',
      'fr': 'Définir le filtre',
      'sw': 'Weka Silter',
    },
    'w1d1a58b': {
      'en': 'Categories',
      'ar': 'فئات',
      'es': 'Categorías',
      'fr': 'Catégories',
      'sw': 'Kategoria',
    },
    'uowa8nmy': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'w57psrgq': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
      'sw': 'Nguo',
    },
    'p7nrhsmv': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
      'sw': 'Viatu',
    },
    'jx7t74kq': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
      'sw': 'Nyumba',
    },
    'ex9mvks4': {
      'en': 'Price Range',
      'ar': 'نطاق السعر',
      'es': 'Rango de precios',
      'fr': 'Échelle des prix',
      'sw': 'Kiwango cha Bei',
    },
    'saebe8dt': {
      'en': ' Bigger than',
      'ar': 'أكبر من',
      'es': 'Más grande que',
      'fr': 'Plus grand que',
      'sw': 'Kubwa kuliko',
    },
    'gb5tjvja': {
      'en': 'Rating',
      'ar': 'تقييم',
      'es': 'Clasificación',
      'fr': 'Notation',
      'sw': 'Ukadiriaji',
    },
    '6he5ti4q': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
      'sw': 'Weka upya',
    },
    'i61rorb6': {
      'en': 'Apply',
      'ar': 'يتقدم',
      'es': 'Aplicar',
      'fr': 'Appliquer',
      'sw': 'Omba',
    },
    '5xuhsyxb': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Detail
  {
    'o5wkoto8': {
      'en': 'Description',
      'ar': 'وصف',
      'es': 'Descripción',
      'fr': 'Description',
      'sw': 'Maelezo',
    },
    't4bmaz0f': {
      'en': 'Size',
      'ar': 'مقاس',
      'es': 'Tamaño',
      'fr': 'Taille',
      'sw': 'Ukubwa',
    },
    '28n06hrc': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
      'sw': 'Rangi',
    },
    'bg34hrvp': {
      'en': 'Quantity',
      'ar': 'كمية',
      'es': 'Cantidad',
      'fr': 'Quantité',
      'sw': 'Kiasi',
    },
    'xic97283': {
      'en': 'Last 3 reviews',
      'ar': 'آخر 3 مراجعات',
      'es': 'Últimas 3 reseñas',
      'fr': '3 derniers avis',
      'sw': 'Maoni 3 ya mwisho',
    },
    'gqq3y3bn': {
      'en': 'See All Review',
      'ar': 'شاهد كل المراجعة',
      'es': 'Ver toda la reseña',
      'fr': 'Voir tous les avis',
      'sw': 'Tazama Mapitio Yote',
    },
    'rp699b33': {
      'en': 'Give Review',
      'ar': 'إعطاء مراجعة',
      'es': 'Dar reseña',
      'fr': 'Donner un avis',
      'sw': 'Toa Tathmini',
    },
    'a20jna9f': {
      'en': 'Total price',
      'ar': 'السعر الكلي',
      'es': 'Precio total',
      'fr': 'Prix ​​total',
      'sw': 'Bei jumla',
    },
    'ks32533k': {
      'en': 'Add To Cart',
      'ar': 'أضف إلى السلة',
      'es': 'Añadir a la cesta',
      'fr': 'Ajouter au panier',
      'sw': 'Ongeza kwenye Cart',
    },
    'oi35mceo': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Reviews
  {
    'zcp7cypr': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // CheckOut
  {
    'lcnyw3hc': {
      'en': 'Checkout',
      'ar': 'الدفع',
      'es': 'Verificar',
      'fr': 'Vérifier',
      'sw': 'Angalia',
    },
    'cr0qzef5': {
      'en': 'Shipping Address',
      'ar': 'عنوان الشحن',
      'es': 'Dirección de envío',
      'fr': 'adresse de livraison',
      'sw': 'Anwani ya kusafirishia',
    },
    'q65z9dgb': {
      'en': 'Add address',
      'ar': 'اضف عنوان',
      'es': 'Añadir dirección',
      'fr': 'Ajoutez l\'adresse',
      'sw': 'Ongeza anwani',
    },
    'soey72ow': {
      'en': 'No address set you need to add one',
      'ar': 'ليس لديك عنوان تحتاج إلى إضافته',
      'es': 'No tienes una dirección, necesitas agregar una.',
      'fr': 'Vous n\'avez pas d\'adresse, vous devez en ajouter une',
      'sw': 'Huna anwani unayohitaji kuongeza',
    },
    'gxxkgt1t': {
      'en': 'Add Address',
      'ar': 'اضف عنوان',
      'es': 'Añadir dirección',
      'fr': 'Ajoutez l\'adresse',
      'sw': 'Ongeza Anwani',
    },
    'zchnfbgp': {
      'en': 'Order List',
      'ar': 'لائحة الطلبات',
      'es': 'Lista de orden',
      'fr': 'Liste de commande',
      'sw': 'Orodha ya Agizo',
    },
    '1tzdw8n3': {
      'en': 'Choose Shipping ',
      'ar': 'اختر الشحن',
      'es': 'Elige Envío',
      'fr': 'Choisissez l\'expédition',
      'sw': 'Chagua Usafirishaji',
    },
    '63ukigmn': {
      'en': 'Shipping Type',
      'ar': 'نوع الشحن',
      'es': 'Tipo de envío',
      'fr': 'Type d\'expédition',
      'sw': 'Aina ya Usafirishaji',
    },
    'hpkhn6l4': {
      'en': 'Promo Code',
      'ar': 'رمز ترويجي',
      'es': 'Código promocional',
      'fr': 'Code promo',
      'sw': 'Msimbo wa Matangazo',
    },
    'zoauj27p': {
      'en': 'Add promo code',
      'ar': 'أضف الرمز الترويجي',
      'es': 'Agregar código de promoción',
      'fr': 'Ajouter un code promotionnel',
      'sw': 'Ongeza msimbo wa ofa',
    },
    'l3ywbl1a': {
      'en': 'Amount',
      'ar': 'كمية',
      'es': 'Cantidad',
      'fr': 'Montant',
      'sw': 'Kiasi',
    },
    'faj38kvq': {
      'en': 'Discount Promo',
      'ar': 'عرض ترويجي للخصم',
      'es': 'Promoción de descuento',
      'fr': 'Promotion de réduction',
      'sw': 'Matangazo ya Punguzo',
    },
    '2z3oxb96': {
      'en': 'Tax',
      'ar': 'ضريبة',
      'es': 'Impuesto',
      'fr': 'Impôt',
      'sw': 'Kodi',
    },
    'py9hn48c': {
      'en': 'Total',
      'ar': 'المجموع',
      'es': 'Total',
      'fr': 'Total',
      'sw': 'Jumla',
    },
    '1ra0ur6u': {
      'en': 'Continue to Payment',
      'ar': 'الاستمرار في الدفع',
      'es': 'Continuar con el pago',
      'fr': 'Continuer vers le paiement',
      'sw': 'Endelea kwa Malipo',
    },
    'edogkbdu': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // ShippingMethods
  {
    'l1dhmm8m': {
      'en': 'Shipping Methods',
      'ar': 'طرق الشحن',
      'es': 'Métodos de envío',
      'fr': 'méthodes de livraison',
      'sw': 'Mbinu za Usafirishaji',
    },
    '8fd1mbm0': {
      'en': 'Default shipping method',
      'ar': 'طريقة الشحن الافتراضية',
      'es': 'Método de envío predeterminado',
      'fr': 'Méthode d\'expédition par défaut',
      'sw': 'Mbinu chaguomsingi ya usafirishaji',
    },
    'yedvbog3': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // OrderHistory
  {
    'efhey8ak': {
      'en': 'Ongoing',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '0gksitwh': {
      'en': ' | ',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'c3kfbwmo': {
      'en': 'Track Order',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'lt2h4o6l': {
      'en': 'Completed',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'h0ogqdhf': {
      'en': ' | ',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '7l0fm80s': {
      'en': 'E-Receipt',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'p1a2sd5k': {
      'en': 'Orders',
      'ar': 'طلبات',
      'es': 'Pedidos',
      'fr': 'Ordres',
      'sw': 'Maagizo',
    },
  },
  // Donation
  {
    'frf133b7': {
      'en': 'Donations',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'vc6y63ya': {
      'en':
          'Support the Artists, Empower the Community\n\nAt Art Fro Scentric Studios, your generosity goes a long way in empowering talented African artists and promoting cultural diversity. By donating, you help provide resources, opportunities, and a platform for underserved artists to showcase their work and reach a global audience.\n\nHow Your Donation Helps\n\nArtist Development: Funds are used for art supplies, workshops, and mentorship programs to help artists refine their skills and grow their careers.\n\nExhibition Opportunities: Your support enables us to organize exhibitions and events that give artists the exposure they need to succeed.\n\nCommunity Projects: We invest in community-driven art projects that enrich local cultures and bring people together through creativity.\n\nOperational Support: Donations help us maintain our platform, ensuring a seamless experience for both artists and art lovers.\n\nMake a Difference Today\n\nYour donation, no matter the size, makes a significant impact. Together, we can create a thriving community where art and culture flourish. To donate, simply click the button below and choose your preferred amount.\n\nDonate now to: +254719228831\n\nOther Ways to Support\n\nPurchase Art: Buying artwork from our platform directly supports the artists and helps them sustain their creative endeavors.\n\nSpread the Word: Share our mission with friends and family, and follow us on social media to help us reach a wider audience.\n\nVolunteer: Offer your time and skills to support our events and initiatives. Contact us at [insert contact email] for more information.\n\nThank you for your generosity and commitment to making a difference. Together, we can empower artists and enrich lives through the beauty of art.\n\nWarm regards,\nThe Art Fro Scentric Studios Team',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'jtx8cfu7': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'es': 'Billetera',
      'fr': 'Portefeuille',
      'sw': 'Mkoba',
    },
  },
  // TrackOrder
  {
    '0fdxovbj': {
      'en': 'Track Order',
      'ar': 'ترتيب المسار',
      'es': 'Orden de pista',
      'fr': 'Suivi de commande',
      'sw': 'Kufuatilia Agizo',
    },
    'iutxeqb9': {
      'en': ' | ',
      'ar': '|',
      'es': '|',
      'fr': '|',
      'sw': '|',
    },
    'dg29me9q': {
      'en': 'E-Receipt',
      'ar': 'الإيصال الإلكتروني',
      'es': 'Recibo electrónico',
      'fr': 'Reçu électronique',
      'sw': 'Risiti ya kielektroniki',
    },
    'vd90fj5x': {
      'en': 'Packet In Delivery',
      'ar': 'الحزمة في التسليم',
      'es': 'Paquete en entrega',
      'fr': 'Paquet en livraison',
      'sw': 'Pakiti Katika Uwasilishaji',
    },
    'nj6cdd5z': {
      'en': 'Order Status Details',
      'ar': 'تفاصيل حالة الطلب',
      'es': 'Detalles del estado del pedido',
      'fr': 'Détails de l\'état de la commande',
      'sw': 'Maelezo ya Hali ya Agizo',
    },
    'csopoxiy': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // E-Receipt
  {
    '4pnbmsvt': {
      'en': 'E-Receipt',
      'ar': 'الإيصال الإلكتروني',
      'es': 'Recibo electrónico',
      'fr': 'Reçu électronique',
      'sw': 'Risiti ya kielektroniki',
    },
    'rku8ashr': {
      'en': 'Products',
      'ar': 'منتجات',
      'es': 'Productos',
      'fr': 'Des produits',
      'sw': 'Bidhaa',
    },
    'juoncty0': {
      'en': 'Amount',
      'ar': 'كمية',
      'es': 'Cantidad',
      'fr': 'Montant',
      'sw': 'Kiasi',
    },
    'bgfj2b8l': {
      'en': 'Discount Promo',
      'ar': 'عرض ترويجي للخصم',
      'es': 'Promoción de descuento',
      'fr': 'Promotion de réduction',
      'sw': 'Matangazo ya Punguzo',
    },
    'zlo1vf83': {
      'en': 'Tax',
      'ar': 'ضريبة',
      'es': 'Impuesto',
      'fr': 'Impôt',
      'sw': 'Kodi',
    },
    'qybu93v0': {
      'en': 'Total',
      'ar': 'المجموع',
      'es': 'Total',
      'fr': 'Total',
      'sw': 'Jumla',
    },
    'zw5b09tu': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'méthodes de payement',
      'sw': 'Mbinu za Malipo',
    },
    'ekgrm4n3': {
      'en': 'Date',
      'ar': 'تاريخ',
      'es': 'Fecha',
      'fr': 'Date',
      'sw': 'Tarehe',
    },
    '1c2rw0yq': {
      'en': ' | ',
      'ar': '|',
      'es': '|',
      'fr': '|',
      'sw': '|',
    },
    '8ztetcy5': {
      'en': 'Transaction ID',
      'ar': 'رقم المعاملة',
      'es': 'ID de transacción',
      'fr': 'identifiant de transaction',
      'sw': 'Kitambulisho cha muamala',
    },
    'lt24pjd9': {
      'en': 'Paid to:',
      'ar': 'حالة',
      'es': 'Estado',
      'fr': 'Statut',
      'sw': 'Hali',
    },
    '2tt2z04l': {
      'en': 'Paid upon:',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'qcgia77v': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Profile
  {
    'k6cax06h': {
      'en': 'My Profile',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'd7u51fkx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
      'sw': 'Badilisha Wasifu',
    },
    '8q5jfic8': {
      'en': 'Customer Chat Support',
      'ar': 'دعم دردشة العملاء',
      'es': 'Atención al cliente por chat',
      'fr': 'Assistance par chat client',
      'sw': 'Usaidizi wa Gumzo kwa Wateja',
    },
    'p8yov6z8': {
      'en': 'Addresses',
      'ar': 'عناوين',
      'es': 'Direcciones',
      'fr': 'Adresses',
      'sw': 'Anwani',
    },
    '0aind4e3': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'méthodes de payement',
      'sw': 'Mbinu za Malipo',
    },
    'qm6n90dg': {
      'en': 'Shipping Methods',
      'ar': 'طرق الشحن',
      'es': 'Métodos de envío',
      'fr': 'méthodes de livraison',
      'sw': 'Mbinu za Usafirishaji',
    },
    'wdaxbt53': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
      'es': 'Configuración de las notificaciones',
      'fr': 'Paramètres de notification',
      'sw': 'Mipangilio ya Arifa',
    },
    'xavekhvr': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'sw': 'Sera ya Faragha',
    },
    'eg8f0kw7': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'es': 'Centro de ayuda',
      'fr': 'Centre d\'aide',
      'sw': 'Kituo cha Usaidizi',
    },
    're3dkt1r': {
      'en': 'Language',
      'ar': 'لغة',
      'es': 'Idioma',
      'fr': 'Langue',
      'sw': 'Lugha',
    },
    'gho3sizt': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
      'sw': 'Hali ya Giza',
    },
    'v2ce8oo7': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
      'sw': 'Ondoka',
    },
    '0uk7gol4': {
      'en': 'Version 1.0.01 ',
      'ar': 'الإصدار 1.0.01',
      'es': 'Versión 1.0.01',
      'fr': 'Version 1.0.01',
      'sw': 'Toleo la 1.0.01',
    },
    'ksujdsg6': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'es': 'Perfil',
      'fr': 'Profil',
      'sw': 'Wasifu',
    },
  },
  // ProfileEdit
  {
    'tottirw2': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
      'sw': 'Badilisha Wasifu',
    },
    'jusrtbjm': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
      'sw': 'Jina kamili',
    },
    'pzwy4ayf': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
      'sw': 'Jina la mtumiaji',
    },
    'aekq22u1': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'a5mm73r4': {
      'en': '+13025079012',
      'ar': '+13025079012',
      'es': '+13025079012',
      'fr': '+13025079012',
      'sw': '+13025079012',
    },
    'ymwhud55': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
      'sw': 'Mwanaume',
    },
    'xywk2uk2': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
      'sw': 'Kike',
    },
    'k4opv0hy': {
      'en': 'Other',
      'ar': 'آخر',
      'es': 'Otro',
      'fr': 'Autre',
      'sw': 'Nyingine',
    },
    'lqwznadd': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
      'sw': 'Jinsia',
    },
    'exh54exr': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'sw': 'Tafuta kipengee...',
    },
    'luoj2o3j': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'cm344mut': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'w3pxefrr': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'imu046hc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'q6q7tf4d': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    't1u4ox74': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '9imci6ne': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'fm7iixkz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'x0wogarh': {
      'en': 'Update',
      'ar': 'تحديث',
      'es': 'Actualizar',
      'fr': 'Mise à jour',
      'sw': 'Sasisha',
    },
    '8gdcsc2y': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Address
  {
    'c7ly452e': {
      'en': 'Shipping Address',
      'ar': 'عنوان الشحن',
      'es': 'Dirección de envío',
      'fr': 'adresse de livraison',
      'sw': 'Anwani ya kusafirishia',
    },
    'fb0n9snd': {
      'en': 'Your Shipping Address',
      'ar': 'عنوان الشحن الخاص بك',
      'es': 'Tu Dirección de Envío',
      'fr': 'Votre adresse de livraison',
      'sw': 'Anwani yako ya Usafirishaji',
    },
    'sw58aq4r': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'es': 'Agregar nueva dirección',
      'fr': 'Ajouter une nouvelle adresse',
      'sw': 'Ongeza Anwani Mpya',
    },
    'ze2rpmir': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // SettingNotification
  {
    '5o6xxes2': {
      'en': 'Notification',
      'ar': 'إشعار',
      'es': 'Notificación',
      'fr': 'Notification',
      'sw': 'Taarifa',
    },
    'u75lm5yr': {
      'en': 'Configure Notification',
      'ar': 'تكوين الإخطار',
      'es': 'Configurar notificación',
      'fr': 'Configurer les notifications',
      'sw': 'Sanidi Arifa',
    },
    'bmzfuj0j': {
      'en': 'General Notification',
      'ar': 'إشعار عام',
      'es': 'Notificación general',
      'fr': 'Notification générale',
      'sw': 'Taarifa ya Jumla',
    },
    '3pb2p19r': {
      'en': 'Sound',
      'ar': 'صوت',
      'es': 'Sonido',
      'fr': 'Son',
      'sw': 'Sauti',
    },
    'sv3dtx8s': {
      'en': 'Vibrate',
      'ar': 'تذبذب',
      'es': 'Vibrar',
      'fr': 'Vibrer',
      'sw': 'Tetema',
    },
    '88hrozp4': {
      'en': 'Special Offers',
      'ar': 'عروض خاصة',
      'es': 'Ofertas especiales',
      'fr': 'Offres spéciales',
      'sw': 'Matoleo Maalum',
    },
    '9xke2qz8': {
      'en': 'Promo & Discount',
      'ar': 'الترويجي والخصم',
      'es': 'Promoción y descuento',
      'fr': 'Promotion et réduction',
      'sw': 'Matangazo na Punguzo',
    },
    '4h1tco6v': {
      'en': 'Payments',
      'ar': 'المدفوعات',
      'es': 'Pagos',
      'fr': 'Paiements',
      'sw': 'Malipo',
    },
    '08nzc77s': {
      'en': 'Cashback',
      'ar': 'استرداد النقود',
      'es': 'Devolución de dinero',
      'fr': 'Remise en argent',
      'sw': 'Pesa',
    },
    'chd8b0nf': {
      'en': 'App Updates',
      'ar': 'تحديثات التطبيق',
      'es': 'Actualizaciones de aplicaciones',
      'fr': 'Mises à jour de l\'application',
      'sw': 'Masasisho ya Programu',
    },
    '05bcm3xa': {
      'en': 'New Service Available',
      'ar': 'خدمة جديدة متاحة',
      'es': 'Nuevo servicio disponible',
      'fr': 'Nouveau service disponible',
      'sw': 'Huduma Mpya Inayopatikana',
    },
    'yojei26s': {
      'en': 'New Tips Available',
      'ar': 'نصائح جديدة متاحة',
      'es': 'Nuevos consejos disponibles',
      'fr': 'Nouveaux conseils disponibles',
      'sw': 'Vidokezo Vipya Vinavyopatikana',
    },
    'k1bv65hz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // PaymentMethods
  {
    'bev5ue3s': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'méthodes de payement',
      'sw': 'Mbinu za Malipo',
    },
    'fcu8uthh': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Language
  {
    '5fhgfbyz': {
      'en': 'Language',
      'ar': 'لغة',
      'es': 'Idioma',
      'fr': 'Langue',
      'sw': 'Lugha',
    },
    'ekmdo5ts': {
      'en': 'Change Language',
      'ar': 'تغيير اللغة',
      'es': 'Cambiar idioma',
      'fr': 'Changer de langue',
      'sw': 'Badilisha Lugha',
    },
    'c49dobms': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // PrivacyPolicy
  {
    '04ty6g4f': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'sw': 'Sera ya Faragha',
    },
    '1udz1udi': {
      'en':
          'Introduction\n\nWelcome to Art Fro Scentric Studios. We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data when you visit our website and purchase our services. By using our website, you agree to the collection and use of information in accordance with this policy.\n\nInformation We Collect:\n\nPersonal Information\n\nWe may collect personal information that you provide directly to us, including but not limited to:\n\nName\nEmail address\nMailing address\nPhone number\nPayment information\n\nNon-Personal Information\nWe may also collect non-personal information about your visit to our website, such as:\n\nBrowser type\nIP address\nPages visited\nTime spent on our site\nHow We Use Your Information\nPersonal Information\n\nWe use the personal information you provide to:\n\nProcess and fulfill your orders\nCommunicate with you about your orders and our services\nSend you promotional materials, if you opt-in\nImprove our website and services\nComply with legal obligations\n\nNon-Personal Information\n\nWe use non-personal information to:\n\nAnalyze and improve the functionality of our website\nMonitor and analyze usage trends\nEnsure the security of our website\nHow We Share Your Information\nWe do not sell, trade, or otherwise transfer your personal information to outside parties, except in the following circumstances:\n\nService Providers: We may share your information with third-party service providers who assist us in operating our website, conducting our business, or serving our users, as long as those parties agree to keep this information confidential.\n\nLegal Requirements: We may disclose your information if required to do so by law or in response to valid requests by public authorities.\n\nData Security\n\nWe implement a variety of security measures to maintain the safety of your personal information. However, no method of transmission over the Internet or electronic storage is completely secure, and we cannot guarantee absolute security.\n\nYour Rights\n\nAccess and review the personal information we have collected about you\nRequest corrections to any inaccurate information\nRequest deletion of your personal information\nOpt-out of receiving promotional communications\nTo exercise these rights, please contact us at [insert contact email].\n\nCookies\n\nOur website uses cookies to enhance your experience. Cookies are small files that a site or its service provider transfers to your computer’s hard drive through your web browser (if you allow), enabling the site’s or service provider’s systems to recognize your browser and capture and remember certain information. You can choose to disable cookies through your browser settings, but doing so may affect your ability to use some features of our website.\n\nChanges to This Privacy Policy\n\nWe may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.\n\nContact Us\n\nIf you have any questions about this Privacy Policy, please contact us at:\n\nArt Fro Scentric Studios\nsupport@artfroscentricstudios.store\nPhone: \n\nThis Privacy Policy is effective as of July 24th 2024',
      'ar':
          'تاريخ السريان: 23 يوليو 2024\n\n1 المقدمة\n\nمرحبًا بك في إي-سوكو. نحن ملتزمون بحماية معلوماتك الشخصية وحقك في الخصوصية. إذا كانت لديك أي أسئلة أو مخاوف بشأن إشعار الخصوصية هذا أو ممارساتنا فيما يتعلق بمعلوماتك الشخصية، فيرجى الاتصال بنا على support@esoko.com.\n\n2. المعلومات التي نجمعها\n\nنقوم بجمع المعلومات الشخصية التي تقدمها لنا طوعًا عند التسجيل في التطبيق، أو التعبير عن اهتمامك بالحصول على معلومات عنا أو عن منتجاتنا وخدماتنا، أو بخلاف ذلك عند الاتصال بنا.\n\nتعتمد المعلومات الشخصية التي نجمعها على سياق تفاعلاتك معنا ومع التطبيق، والاختيارات التي تقوم بها، والمنتجات والميزات التي تستخدمها. قد تتضمن المعلومات الشخصية التي نجمعها ما يلي:\n\nالمعلومات الشخصية التي تقدمها: الاسم وعنوان البريد الإلكتروني ورقم الهاتف ومعلومات الاتصال المماثلة الأخرى.\n\nالمعلومات التي يتم جمعها تلقائيًا: عنوان IP، وخصائص المتصفح والجهاز، ونظام التشغيل، وتفضيلات اللغة، وعناوين URL المرجعية، واسم الجهاز، والبلد، والموقع، ومعلومات حول كيفية ووقت استخدام تطبيقنا، والمعلومات الفنية الأخرى.\n\nالمعلومات التي يتم جمعها من خلال ملفات تعريف الارتباط والتقنيات المماثلة: قد نستخدم ملفات تعريف الارتباط وتقنيات التتبع المماثلة (مثل إشارات الويب والبكسلات) للوصول إلى المعلومات أو تخزينها.\n\n3. كيف نستخدم معلوماتك\n\nنحن نستخدم المعلومات الشخصية التي تم جمعها عبر تطبيقنا لمجموعة متنوعة من الأغراض التجارية الموضحة أدناه. نقوم بمعالجة معلوماتك الشخصية لهذه الأغراض بالاعتماد على مصالحنا التجارية المشروعة، لإبرام عقد معك أو تنفيذه، بموافقتك، و/أو للامتثال لالتزاماتنا القانونية.\n\nنحن نستخدم المعلومات التي نجمعها أو نتلقاها:\n\nلتسهيل إنشاء الحساب وعملية تسجيل الدخول.\nلإرسال معلومات إدارية إليك لأغراض تجارية و/أو لأسباب قانونية و/أو ربما لأسباب تعاقدية.\nلتلبية وإدارة أوامرك وطلباتك.\nلتقديم الإعلانات المستهدفة لك.\nلنشر الشهادات بموافقتك.\nلإدارة حسابات المستخدمين.\nلإرسال اتصالات تسويقية وترويجية إليك بموافقتك.\nلتقديم الخدمات للمستخدم.\nللرد على استفسارات المستخدم / تقديم الدعم للمستخدمين.\nلأغراض تجارية أخرى.\n\n4. مشاركة معلوماتك\n\nنحن نشارك معلوماتك ونكشف عنها فقط في الحالات التالية:\n\nالامتثال للقوانين: قد نكشف عن معلوماتك عندما يُطلب منا قانونًا القيام بذلك امتثالاً للقانون المعمول به أو الطلبات الحكومية أو الإجراءات القضائية أو أمر المحكمة أو الإجراءات القانونية.\n\nالمصالح الحيوية والحقوق القانونية: قد نكشف عن معلوماتك عندما نعتقد أنه من الضروري التحقيق أو منع أو اتخاذ إجراء بشأن الانتهاكات المحتملة لسياساتنا، والاحتيال المشتبه به، والمواقف التي تنطوي على تهديدات محتملة لسلامة أي شخص وأنشطة غير قانونية، أو كدليل في الدعاوى القضائية التي نشارك فيها.\n\nالبائعون والاستشاريون ومقدمو الخدمات الآخرون: قد نشارك بياناتك مع البائعين الخارجيين أو مقدمي الخدمات أو المقاولين أو الوكلاء الذين يقدمون خدمات لنا أو نيابة عنا ويطلبون الوصول إلى هذه المعلومات للقيام بهذا العمل.\n\nتشمل الأمثلة: معالجة الدفع، وتحليل البيانات، وتسليم البريد الإلكتروني، وخدمات الاستضافة، وخدمة العملاء، وجهود التسويق. \n\nقد نسمح لأطراف ثالثة مختارة باستخدام تقنية التتبع على التطبيق، مما سيمكنهم من جمع البيانات نيابة عنا حول كيفية تفاعلك مع تطبيقنا مع مرور الوقت. يمكن استخدام هذه المعلومات، من بين أمور أخرى، لتحليل البيانات وتتبعها، وتحديد مدى شعبية محتوى أو صفحات أو ميزات معينة، وفهم النشاط عبر الإنترنت بشكل أفضل.\n\nتحويلات الأعمال: يجوز لنا مشاركة معلوماتك أو نقلها فيما يتعلق أو أثناء المفاوضات بشأن أي اندماج أو بيع أصول الشركة أو تمويل أو الاستحواذ على كل أو جزء من أعمالنا لشركة أخرى.\n\n5. حقوق الخصوصية الخاصة بك\n\nاعتمادًا على موقعك، قد تتمتع بالحقوق التالية فيما يتعلق بمعلوماتك الشخصية:\n\nالحق في الوصول وإمكانية النقل: يمكنك طلب الوصول إلى معلوماتك الشخصية المخزنة لدينا.\n\nالحق في التصحيح: يمكنك أن تطلب منا تصحيح أي معلومات غير دقيقة في معلوماتك الشخصية.\n\nالحق في الحذف: يمكنك أن تطلب منا حذف معلوماتك الشخصية.\n\nالحق في الاعتراض: يمكنك الاعتراض على معالجة معلوماتك الشخصية.\n\nالحق في تقييد المعالجة: يمكنك أن تطلب تقييد معالجة معلوماتك الشخصية.\n\nالحق في سحب الموافقة: إذا كنا نعالج معلوماتك الشخصية بناءً على موافقتك، فيحق لك سحب موافقتك في أي وقت.\n\nلممارسة هذه الحقوق، يرجى الاتصال بنا على support@esoko.com. سنرد على طلبك وفقًا لقوانين حماية البيانات المعمول بها.\n\n6. أمن البيانات\n\nلقد قمنا بتنفيذ إجراءات أمنية فنية وتنظيمية مناسبة مصممة لحماية أمن أي معلومات شخصية نقوم بمعالجتها. ومع ذلك، يرجى أيضًا أن تتذكر أنه لا يمكننا ضمان أن يكون الإنترنت نفسه آمنًا بنسبة 100%. على الرغم من أننا سنبذل قصارى جهدنا لحماية معلوماتك الشخصية، إلا أن نقل المعلومات الشخصية من وإلى تطبيقنا يكون على مسؤوليتك الخاصة. يجب عليك الوصول إلى الخدمات فقط في بيئة آمنة.\n\n7. الاحتفاظ بالبيانات\n\nسنحتفظ بمعلوماتك الشخصية فقط طالما كان ذلك ضروريًا للأغراض المنصوص عليها في سياسة الخصوصية هذه، ما لم تكن هناك فترة احتفاظ أطول مطلوبة أو مسموح بها بموجب القانون (مثل الضرائب أو المحاسبة أو المتطلبات القانونية الأخرى).\n\n8. التغييرات في سياسة الخصوصية هذه\n\nقد نقوم بتحديث سياسة الخصوصية هذه من وقت لآخر لكي تعكس، على سبيل المثال، التغييرات التي تطرأ على ممارساتنا أو لأسباب تشغيلية أو قانونية أو تنظيمية أخرى. سنقوم بإعلامك بأي تغييرات عن طريق نشر سياسة الخصوصية الجديدة على تطبيقنا. ننصحك بمراجعة سياسة الخصوصية هذه بشكل دوري لمعرفة أي تغييرات.\n\n9. اتصل بنا\n\nإذا كانت لديك أي أسئلة أو مخاوف بشأن سياسة الخصوصية هذه أو ممارساتنا فيما يتعلق بمعلوماتك الشخصية، فيرجى الاتصال بنا على:\n\nدعم سوكو الإلكتروني\nالبريد الإلكتروني: support@esoko.com',
      'es':
          'Fecha de vigencia: 23 de julio de 2024\n\n1. Introducción\n\nBienvenido a E-Soko. Estamos comprometidos a proteger su información personal y su derecho a la privacidad. Si tiene alguna pregunta o inquietud sobre este aviso de privacidad o nuestras prácticas con respecto a su información personal, contáctenos en support@esoko.com.\n\n2. Información que recopilamos\n\nRecopilamos información personal que usted nos proporciona voluntariamente cuando se registra en la aplicación, expresa interés en obtener información sobre nosotros o nuestros productos y servicios, o de otro modo cuando se comunica con nosotros.\n\nLa información personal que recopilamos depende del contexto de sus interacciones con nosotros y la aplicación, las elecciones que haga y los productos y funciones que utilice. La información personal que recopilamos puede incluir lo siguiente:\n\nInformación personal proporcionada por usted: nombre, dirección de correo electrónico, número de teléfono y otra información de contacto similar.\n\nInformación recopilada automáticamente: dirección IP, características del navegador y del dispositivo, sistema operativo, preferencias de idioma, URL de referencia, nombre del dispositivo, país, ubicación, información sobre cómo y cuándo usa nuestra aplicación y otra información técnica.\n\nInformación recopilada a través de cookies y tecnologías similares: podemos utilizar cookies y tecnologías de seguimiento similares (como balizas web y píxeles) para acceder o almacenar información.\n\n3. Cómo utilizamos su información\n\nUtilizamos la información personal recopilada a través de nuestra aplicación para una variedad de fines comerciales que se describen a continuación. Procesamos su información personal para estos fines en función de nuestros intereses comerciales legítimos, para celebrar o ejecutar un contrato con usted, con su consentimiento y/o para cumplir con nuestras obligaciones legales.\n\nUsamos la información que recopilamos o recibimos:\n\nPara facilitar la creación de cuentas y el proceso de inicio de sesión.\nPara enviarle información administrativa con fines comerciales, motivos legales y/o posiblemente contractuales.\nPara cumplir y gestionar sus pedidos y solicitudes.\nPara ofrecerle publicidad dirigida.\nPara publicar testimonios con su consentimiento.\nPara gestionar cuentas de usuario.\nPara enviarle comunicaciones promocionales y de marketing con su consentimiento.\nPara prestar servicios al usuario.\nResponder a las consultas de los usuarios/ofrecer soporte a los usuarios.\nPara otros fines comerciales.\n\n4. Compartir su información\n\nSolo compartimos y divulgamos su información en las siguientes situaciones:\n\nCumplimiento de las leyes: podemos divulgar su información cuando estemos legalmente obligados a hacerlo para cumplir con la ley aplicable, solicitudes gubernamentales, un procedimiento judicial, una orden judicial o un proceso legal.\n\nIntereses vitales y derechos legales: podemos divulgar su información cuando creamos que es necesario para investigar, prevenir o tomar medidas con respecto a posibles violaciones de nuestras políticas, sospecha de fraude, situaciones que involucren amenazas potenciales a la seguridad de cualquier persona y actividades ilegales, o como prueba en litigios en los que estemos involucrados.\n\nProveedores, consultores y otros proveedores de servicios externos: podemos compartir sus datos con proveedores externos, proveedores de servicios, contratistas o agentes que prestan servicios para nosotros o en nuestro nombre y requieren acceso a dicha información para realizar ese trabajo.\n\nLos ejemplos incluyen: procesamiento de pagos, análisis de datos, entrega de correo electrónico, servicios de alojamiento, servicio al cliente y esfuerzos de marketing. \n\nPodemos permitir que terceros seleccionados utilicen tecnología de seguimiento en la aplicación, lo que les permitirá recopilar datos en nuestro nombre sobre cómo interactúa con nuestra aplicación a lo largo del tiempo. Esta información puede usarse, entre otras cosas, para analizar y rastrear datos, determinar la popularidad de ciertos contenidos, páginas o funciones y comprender mejor la actividad en línea.\n\nTransferencias comerciales: podemos compartir o transferir su información en relación con, o durante las negociaciones de, cualquier fusión, venta de activos de la empresa, financiación o adquisición de todo o una parte de nuestro negocio a otra empresa.\n\n5. Sus derechos de privacidad\n\nDependiendo de su ubicación, puede tener los siguientes derechos con respecto a su información personal:\n\nDerecho de acceso y portabilidad: puede solicitar acceso a su información personal almacenada por nosotros.\n\nDerecho de corrección: puede solicitar que corrijamos cualquier inexactitud en su información personal.\n\nDerecho a eliminación: puede solicitar que eliminemos su información personal.\n\nDerecho a oponerse: puede oponerse al procesamiento de su información personal.\n\nDerecho a restringir el procesamiento: puede solicitar que restrinjamos el procesamiento de su información personal.\n\nDerecho a retirar el consentimiento: si procesamos su información personal en función de su consentimiento, tiene derecho a retirar su consentimiento en cualquier momento.\n\nPara ejercer estos derechos, contáctenos en support@esoko.com. Responderemos a su solicitud de acuerdo con las leyes de protección de datos aplicables.\n\n6. Seguridad de los datos\n\nHemos implementado medidas de seguridad técnicas y organizativas apropiadas diseñadas para proteger la seguridad de cualquier información personal que procesamos. Sin embargo, recuerde también que no podemos garantizar que Internet sea 100% seguro. Aunque haremos todo lo posible para proteger su información personal, la transmisión de información personal hacia y desde nuestra aplicación es bajo su propio riesgo. Sólo debe acceder a los servicios dentro de un entorno seguro.\n\n7. Retención de datos\n\nSolo conservaremos su información personal durante el tiempo que sea necesario para los fines establecidos en esta política de privacidad, a menos que la ley requiera o permita un período de retención más prolongado (como requisitos fiscales, contables u otros requisitos legales).\n\n8. Cambios a esta Política de Privacidad\n\nPodemos actualizar esta política de privacidad de vez en cuando para reflejar, por ejemplo, cambios en nuestras prácticas o por otras razones operativas, legales o regulatorias. Le notificaremos cualquier cambio publicando la nueva política de privacidad en nuestra aplicación. Se le recomienda revisar esta política de privacidad periódicamente para detectar cualquier cambio.\n\n9. Contáctenos\n\nSi tiene alguna pregunta o inquietud sobre esta política de privacidad o nuestras prácticas con respecto a su información personal, comuníquese con nosotros a:\n\nSoporte E-Soko\nCorreo electrónico: support@esoko.com',
      'fr':
          'Date d\'entrée en vigueur : 23 juillet 2024\n\n1. Introduction\n\nBienvenue chez E-Soko. Nous nous engageons à protéger vos informations personnelles et votre droit à la vie privée. Si vous avez des questions ou des préoccupations concernant cet avis de confidentialité ou nos pratiques concernant vos informations personnelles, veuillez nous contacter à support@esoko.com.\n\n2. Informations que nous collectons\n\nNous collectons les informations personnelles que vous nous fournissez volontairement lorsque vous vous inscrivez sur l\'application, exprimez votre intérêt à obtenir des informations sur nous ou sur nos produits et services, ou autrement lorsque vous nous contactez.\n\nLes informations personnelles que nous collectons dépendent du contexte de vos interactions avec nous et avec l\'application, des choix que vous faites et des produits et fonctionnalités que vous utilisez. Les informations personnelles que nous collectons peuvent inclure les éléments suivants :\n\nInformations personnelles fournies par vous : nom, adresse e-mail, numéro de téléphone et autres informations de contact similaires.\n\nInformations collectées automatiquement : adresse IP, caractéristiques du navigateur et de l\'appareil, système d\'exploitation, préférences linguistiques, URL de référence, nom de l\'appareil, pays, emplacement, informations sur la manière et le moment où vous utilisez notre application et autres informations techniques.\n\nInformations collectées via des cookies et des technologies similaires : nous pouvons utiliser des cookies et des technologies de suivi similaires (telles que des balises Web et des pixels) pour accéder ou stocker des informations.\n\n3. Comment nous utilisons vos informations\n\nNous utilisons les informations personnelles collectées via notre application à diverses fins commerciales décrites ci-dessous. Nous traitons vos informations personnelles à ces fins en nous appuyant sur nos intérêts commerciaux légitimes, pour conclure ou exécuter un contrat avec vous, avec votre consentement, et/ou pour nous conformer à nos obligations légales.\n\nNous utilisons les informations que nous collectons ou recevons :\n\nPour faciliter le processus de création de compte et de connexion.\nPour vous envoyer des informations administratives à des fins commerciales, juridiques et/ou éventuellement contractuelles.\nPour exécuter et gérer vos commandes et demandes.\nPour vous proposer des publicités ciblées.\nPour publier des témoignages avec votre consentement.\nPour gérer les comptes utilisateurs.\nPour vous envoyer des communications marketing et promotionnelles avec votre consentement.\nPour fournir des services à l\'utilisateur.\nPour répondre aux demandes des utilisateurs/offrir une assistance aux utilisateurs.\nÀ d\'autres fins commerciales.\n\n4. Partager vos informations\n\nNous partageons et divulguons vos informations uniquement dans les situations suivantes :\n\nConformité aux lois : nous pouvons divulguer vos informations lorsque nous sommes légalement tenus de le faire pour nous conformer à la loi applicable, aux demandes gouvernementales, à une procédure judiciaire, à une ordonnance d\'un tribunal ou à une procédure judiciaire.\n\nIntérêts vitaux et droits légaux : nous pouvons divulguer vos informations lorsque nous pensons que cela est nécessaire pour enquêter, prévenir ou prendre des mesures concernant des violations potentielles de nos politiques, des fraudes présumées, des situations impliquant des menaces potentielles pour la sécurité de toute personne et des activités illégales, ou comme preuve dans les litiges dans lesquels nous sommes impliqués.\n\nFournisseurs, consultants et autres fournisseurs de services tiers : nous pouvons partager vos données avec des fournisseurs tiers, des prestataires de services, des sous-traitants ou des agents qui fournissent des services pour nous ou en notre nom et ont besoin d\'accéder à ces informations pour effectuer ce travail.\n\nLes exemples incluent : le traitement des paiements, l’analyse des données, la livraison d’e-mails, les services d’hébergement, le service client et les efforts de marketing. \n\nNous pouvons autoriser des tiers sélectionnés à utiliser une technologie de suivi sur l\'application, ce qui leur permettra de collecter des données en notre nom sur la façon dont vous interagissez avec notre application au fil du temps. Ces informations peuvent être utilisées, entre autres, pour analyser et suivre les données, déterminer la popularité de certains contenus, pages ou fonctionnalités et mieux comprendre l\'activité en ligne.\n\nTransferts d\'entreprises : nous pouvons partager ou transférer vos informations dans le cadre de, ou pendant les négociations de, toute fusion, vente d\'actifs de l\'entreprise, financement ou acquisition de tout ou partie de notre entreprise à une autre société.\n\n5. Vos droits en matière de confidentialité\n\nEn fonction de votre localisation, vous pouvez disposer des droits suivants concernant vos informations personnelles :\n\nDroit d\'accès et de portabilité : vous pouvez demander l\'accès à vos informations personnelles que nous stockons.\n\nDroit de correction : vous pouvez demander que nous corrigions toute inexactitude dans vos informations personnelles.\n\nDroit de suppression : vous pouvez demander que nous supprimions vos informations personnelles.\n\nDroit d\'opposition : Vous pouvez vous opposer au traitement de vos informations personnelles.\n\nDroit de restreindre le traitement : vous pouvez demander que nous limitions le traitement de vos informations personnelles.\n\nDroit de retirer votre consentement : Si nous traitons vos informations personnelles sur la base de votre consentement, vous avez le droit de retirer votre consentement à tout moment.\n\nPour exercer ces droits, veuillez nous contacter à support@esoko.com. Nous répondrons à votre demande conformément aux lois applicables en matière de protection des données.\n\n6. Sécurité des données\n\nNous avons mis en œuvre des mesures de sécurité techniques et organisationnelles appropriées conçues pour protéger la sécurité de toutes les informations personnelles que nous traitons. Cependant, n’oubliez pas que nous ne pouvons pas garantir qu’Internet lui-même soit sécurisé à 100 %. Bien que nous fassions de notre mieux pour protéger vos informations personnelles, la transmission d\'informations personnelles vers et depuis notre application se fait à vos propres risques. Vous ne devez accéder aux services que dans un environnement sécurisé.\n\n7. Conservation des données\n\nNous ne conserverons vos informations personnelles que le temps nécessaire aux fins énoncées dans la présente politique de confidentialité, à moins qu\'une période de conservation plus longue ne soit requise ou autorisée par la loi (telle que la fiscalité, la comptabilité ou d\'autres exigences légales).\n\n8. Modifications de cette politique de confidentialité\n\nNous pouvons mettre à jour cette politique de confidentialité de temps à autre afin de refléter, par exemple, des changements dans nos pratiques ou pour d\'autres raisons opérationnelles, juridiques ou réglementaires. Nous vous informerons de tout changement en publiant la nouvelle politique de confidentialité sur notre application. Il vous est conseillé de consulter périodiquement cette politique de confidentialité pour tout changement.\n\n9. Contactez-nous\n\nSi vous avez des questions ou des préoccupations concernant cette politique de confidentialité ou nos pratiques concernant vos informations personnelles, veuillez nous contacter à :\n\nAssistance E-Soko\nE-mail : support@esoko.com',
      'sw':
          'Tarehe ya Kutumika: Julai 23, 2024\n\n1. Utangulizi\n\nKaribu kwenye E-Soko. Tumejitolea kulinda taarifa zako za kibinafsi na haki yako ya faragha. Ikiwa una maswali yoyote au wasiwasi kuhusu notisi hii ya faragha au desturi zetu kuhusu maelezo yako ya kibinafsi, tafadhali wasiliana nasi kwa support@esoko.com.\n\n2. Taarifa Tunazokusanya\n\nTunakusanya taarifa za kibinafsi ambazo unatupatia kwa hiari unapojisajili kwenye programu, kuonyesha nia ya kupata taarifa kuhusu sisi au bidhaa na huduma zetu, au vinginevyo unapowasiliana nasi.\n\nTaarifa ya kibinafsi tunayokusanya inategemea muktadha wa mwingiliano wako nasi na programu, chaguo unazofanya na bidhaa na vipengele unavyotumia. Taarifa za kibinafsi tunazokusanya zinaweza kujumuisha zifuatazo:\n\nTaarifa za Kibinafsi Zilizotolewa Na Wewe: Jina, anwani ya barua pepe, nambari ya simu na maelezo mengine sawa ya mawasiliano.\n\nTaarifa Imekusanywa Kiotomatiki: Anwani ya IP, kivinjari na sifa za kifaa, mfumo wa uendeshaji, mapendeleo ya lugha, URL zinazorejelewa, jina la kifaa, nchi, eneo, maelezo kuhusu jinsi na wakati unavyotumia programu yetu na maelezo mengine ya kiufundi.\n\nTaarifa Zilizokusanywa Kupitia Vidakuzi na Teknolojia Zinazofanana: Tunaweza kutumia vidakuzi na teknolojia sawa za ufuatiliaji (kama vile viashiria vya mtandao na pikseli) ili kufikia au kuhifadhi maelezo.\n\n3. Jinsi Tunavyotumia Taarifa Zako\n\nTunatumia maelezo ya kibinafsi yaliyokusanywa kupitia programu yetu kwa madhumuni mbalimbali ya biashara yaliyofafanuliwa hapa chini. Tunachakata maelezo yako ya kibinafsi kwa madhumuni haya kwa kutegemea masilahi yetu halali ya biashara, kuingia au kufanya mkataba nawe, kwa kibali chako, na/au kwa kutii wajibu wetu wa kisheria.\n\nTunatumia habari tunayokusanya au kupokea:\n\nIli kuwezesha kuunda akaunti na mchakato wa kuingia.\nKukutumia maelezo ya usimamizi kwa madhumuni ya biashara, sababu za kisheria, na/au pengine sababu za kimkataba.\nIli kutimiza na kudhibiti maagizo na maombi yako.\nIli kukuletea utangazaji unaolengwa.\nKuchapisha ushuhuda kwa idhini yako.\nIli kudhibiti akaunti za watumiaji.\nIli kukutumia mawasiliano ya uuzaji na utangazaji kwa idhini yako.\nIli kutoa huduma kwa mtumiaji.\nKujibu maswali ya mtumiaji/kutoa usaidizi kwa watumiaji.\nKwa madhumuni mengine ya biashara.\n\n4. Kushiriki Taarifa Zako\n\nTunashiriki tu na kufichua maelezo yako katika hali zifuatazo:\n\nUzingatiaji wa Sheria: Tunaweza kufichua maelezo yako pale tunapohitajika kisheria kufanya hivyo ili kutii sheria inayotumika, maombi ya serikali, kesi ya mahakama, amri ya mahakama, au mchakato wa kisheria.\n\nMaslahi Muhimu na Haki za Kisheria: Tunaweza kufichua maelezo yako pale tunapoamini kuwa ni muhimu kuchunguza, kuzuia, au kuchukua hatua kuhusu uwezekano wa ukiukaji wa sera zetu, tuhuma za ulaghai, hali zinazohusisha vitisho vinavyoweza kutokea kwa usalama wa mtu yeyote na shughuli haramu, au kama ushahidi katika kesi ambayo tunahusika.\n\nWachuuzi, Washauri, na Watoa Huduma Wengine: Tunaweza kushiriki data yako na wachuuzi wengine, watoa huduma, wakandarasi, au mawakala ambao hutufanyia huduma au kwa niaba yetu na kuhitaji ufikiaji wa maelezo kama haya ili kufanya kazi hiyo.\n\nMifano ni pamoja na: usindikaji wa malipo, uchambuzi wa data, uwasilishaji wa barua pepe, huduma za upangishaji, huduma kwa wateja na juhudi za uuzaji. \n\nTunaweza kuruhusu watu wengine waliochaguliwa kutumia teknolojia ya kufuatilia kwenye programu, ambayo itawawezesha kukusanya data kwa niaba yetu kuhusu jinsi unavyoingiliana na programu yetu kwa muda. Taarifa hii inaweza kutumika, miongoni mwa mambo mengine, kuchanganua na kufuatilia data, kubainisha umaarufu wa maudhui fulani, kurasa au vipengele, na kuelewa vyema shughuli za mtandaoni.\n\nUhamisho wa Biashara: Tunaweza kushiriki au kuhamisha maelezo yako kuhusiana na, au wakati wa mazungumzo ya, muunganisho wowote, uuzaji wa mali ya kampuni, ufadhili, au upatikanaji wa yote au sehemu ya biashara yetu kwa kampuni nyingine.\n\n5. Haki zako za Faragha\n\nKulingana na eneo lako, unaweza kuwa na haki zifuatazo kuhusu maelezo yako ya kibinafsi:\n\nHaki ya Kufikia na Kubebeka: Unaweza kuomba ufikiaji wa taarifa zako za kibinafsi zilizohifadhiwa nasi.\n\nHaki ya Kurekebisha: Unaweza kuomba kwamba tusahihishe makosa yoyote katika maelezo yako ya kibinafsi.\n\nHaki ya Kufuta: Unaweza kuomba tufute maelezo yako ya kibinafsi.\n\nHaki ya Kupinga: Unaweza kupinga uchakataji wa taarifa zako za kibinafsi.\n\nHaki ya Kuzuia Uchakataji: Unaweza kuomba tuzuie uchakataji wa maelezo yako ya kibinafsi.\n\nHaki ya Kuondoa Idhini: Ikiwa tunachakata maelezo yako ya kibinafsi kulingana na kibali chako, una haki ya kuondoa idhini yako wakati wowote.\n\nIli kutumia haki hizi, tafadhali wasiliana nasi kwa support@esoko.com. Tutajibu ombi lako kwa mujibu wa sheria zinazotumika za ulinzi wa data.\n\n6. Usalama wa Data\n\nTumetekeleza hatua zinazofaa za kiufundi na za kiusalama za shirika zilizoundwa ili kulinda usalama wa taarifa zozote za kibinafsi tunazochakata. Hata hivyo, tafadhali kumbuka pia kwamba hatuwezi kuthibitisha kwamba mtandao yenyewe ni salama 100%. Ingawa tutajitahidi tuwezavyo kulinda maelezo yako ya kibinafsi, utumaji wa taarifa za kibinafsi kwenda na kutoka kwa programu yetu ni kwa hatari yako mwenyewe. Unapaswa kufikia huduma katika mazingira salama pekee.\n\n7. Uhifadhi wa Data\n\nTutahifadhi tu maelezo yako ya kibinafsi kwa muda mrefu kama ni muhimu kwa madhumuni yaliyowekwa katika sera hii ya faragha, isipokuwa muda mrefu zaidi wa kuhifadhi inahitajika au inaruhusiwa na sheria (kama vile kodi, uhasibu, au mahitaji mengine ya kisheria).\n\n8. Mabadiliko ya Sera hii ya Faragha\n\nTunaweza kusasisha sera hii ya faragha mara kwa mara ili kutafakari, kwa mfano, mabadiliko ya desturi zetu au kwa sababu nyinginezo za kiutendaji, kisheria, au za udhibiti. Tutakuarifu kuhusu mabadiliko yoyote kwa kuchapisha sera mpya ya faragha kwenye programu yetu. Unashauriwa kukagua sera hii ya faragha mara kwa mara kwa mabadiliko yoyote.\n\n9. Wasiliana Nasi\n\nIkiwa una maswali au wasiwasi wowote kuhusu sera hii ya faragha au desturi zetu kuhusu maelezo yako ya kibinafsi, tafadhali wasiliana nasi kwa:\n\nMsaada wa E-Soko\nBarua pepe: support@esoko.com',
    },
    'xltlyert': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // HelpCenter
  {
    '30xieyxq': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'es': 'Centro de ayuda',
      'fr': 'Centre d\'aide',
      'sw': 'Kituo cha Usaidizi',
    },
    'xbv63ple': {
      'en': 'FAQ',
      'ar': 'التعليمات',
      'es': 'Preguntas más frecuentes',
      'fr': 'FAQ',
      'sw': 'Maswali Yanayoulizwa Mara kwa Mara',
    },
    '9lmzwt47': {
      'en': 'What is Art(FRO) SCENTRIC?',
      'ar': 'ما هو إي سوكو؟',
      'es': '¿Qué es E-Soko?',
      'fr': 'Qu’est-ce qu’E-Soko ?',
      'sw': 'E-Soko ni nini?',
    },
    'ho07mkkb': {
      'en':
          'Art Fro Scentric Studios is a social enterprise dedicated to supporting underserved African artists by providing them with a platform to sell their artwork online. We aim to promote cultural diversity and creativity through our curated collection of unique artworks.',
      'ar':
          'E-Soko هو سوق عبر الإنترنت يربط المزارعين مباشرة بالمشترين، مما يسمح لهم ببيع منتجاتهم بكفاءة وبأسعار عادلة.',
      'es':
          'E-Soko es un mercado en línea que conecta a los agricultores directamente con los compradores, permitiéndoles vender sus productos de manera eficiente y a precios justos.',
      'fr':
          'E-Soko est un marché en ligne qui met directement en relation les agriculteurs avec les acheteurs, leur permettant de vendre leurs produits de manière efficace et à des prix équitables.',
      'sw':
          'E-Soko ni soko la mtandaoni linalowaunganisha wakulima moja kwa moja na wanunuzi, na kuwaruhusu kuuza mazao yao kwa ufanisi na kwa bei nzuri.',
    },
    'ht8wud6w': {
      'en': 'Returns and Refunds',
      'ar': 'سياسة الاسترجاع',
      'es': 'Politica de reembolso',
      'fr': 'Politique de remboursement',
      'sw': 'Sera ya kurejesha pesa',
    },
    'q33cnjre': {
      'en':
          'We want you to be completely satisfied with your purchase. If for any reason you are not, you can return the artwork within 30 days of delivery for a full refund or exchange. The artwork must be in its original condition and packaging.\n\nTo return an item, please contact us at artfroscentric@gmail.com with your order number and reason for return. We will provide you with return instructions and a return shipping label if applicable.\n\nOnce we receive your returned item and verify its condition, we will process your refund. Refunds are typically processed within 5-7 business days. You will receive a confirmation email once your refund has been issued.',
      'ar':
          'تاريخ السريان: 24 يوليو\n\n1. نظرة عامة\n\nفي E-Soko، نسعى جاهدين لضمان حصول المشترين والبائعين لدينا على تجربة مرضية. تحدد سياسة استرداد الأموال هذه الشروط والأحكام الخاصة باسترداد الأموال على المعاملات التي تتم من خلال منصتنا.\n\n2. أهلية استرداد الأموال\n\nعادة ما يتم النظر في المبالغ المستردة في ظل الظروف التالية:\n\nالمنتج المستلم يختلف بشكل كبير عن وصفه.\nتلف المنتج أو تلفه عند وصوله.\nلم يتم تسليم المنتج ضمن الإطار الزمني المتفق عليه.\n\n3. طلب ​​استرداد الأموال\n\nلطلب استرداد الأموال، يجب على المشترين:\n\nيرجى التواصل مع دعم عملاء E-Soko خلال 7 أيام من استلام المنتج.\nتقديم شرح تفصيلي للمشكلة وإدراج أي أدلة داعمة، مثل صور المنتج والتغليف الخاص به.\n\n4. عملية استرداد الأموال\n\nعند تلقي طلب استرداد:\n\nستقوم E-Soko بمراجعة الطلب والأدلة الداعمة له.\nقد نتصل بالبائع للحصول على معلومات إضافية.\nسيتم اتخاذ القرار خلال 7 أيام عمل من استلام الطلب.\n\n5. نتائج استرداد الأموال\n\nإذا تمت الموافقة على استرداد الأموال:\n\nسيحصل المشتري على استرداد كامل أو جزئي، اعتمادًا على طبيعة المشكلة.\nستتم معالجة استرداد الأموال باستخدام طريقة الدفع الأصلية.\nقد يُطلب من المشتري إعادة المنتج إلى البائع. في مثل هذه الحالات، ستوفر E-Soko تعليمات لعملية الإرجاع.\n\nإذا تم رفض استرداد الأموال:\n\nسوف تقدم E-Soko شرحًا للقرار.\nيجوز للمشتري استئناف القرار من خلال تقديم معلومات أو أدلة إضافية خلال 5 أيام عمل من تلقي الرفض.\n6. مسؤوليات البائع\n\nالبائعون مسؤولون عن:\n\nالتأكد من أن قوائم المنتجات دقيقة وكاملة.\nتغليف المنتجات بشكل صحيح لمنع تلفها أثناء الشحن.\nمعالجة أي مشاكل مع المشترين في الوقت المناسب وبطريقة احترافية.\n\n7. الاستثناءات\n\nقد لا تكون الحالات التالية مؤهلة لاسترداد الأموال:\n\nتغيير الرأي أو ندم المشتري.\nالمنتجات القابلة للتلف والتي تم فتحها أو استخدامها.\nمنتجات مخصصة أو شخصية تلبي المواصفات المقدمة.\n\n8. اتصل بنا\n\nإذا كانت لديك أي أسئلة حول سياسة استرداد الأموال الخاصة بنا أو كنت بحاجة إلى مساعدة بشأن طلب استرداد الأموال، فيرجى الاتصال بدعم عملاء E-Soko على support@esoko.tz',
      'es':
          'Fecha de vigencia: 24 de julio\n\n1. Información general\n\nEn E-Soko, nos esforzamos por garantizar que nuestros compradores y vendedores tengan una experiencia satisfactoria. Esta Política de reembolso describe los términos y condiciones para los reembolsos de transacciones realizadas a través de nuestra plataforma.\n\n2. Elegibilidad para reembolsos\n\nLos reembolsos generalmente se consideran bajo las siguientes circunstancias:\n\nEl producto recibido difiere significativamente de su descripción.\nEl producto está dañado o estropeado a su llegada.\nEl producto no fue entregado en el plazo acordado.\n\n3. Solicitar un reembolso\n\nPara solicitar un reembolso, los compradores deben:\n\nComuníquese con el servicio de atención al cliente de E-Soko dentro de los 7 días posteriores a la recepción del producto.\nProporcione una explicación detallada del problema e incluya cualquier evidencia de respaldo, como fotografías del producto y su embalaje.\n\n4. Proceso de reembolso\n\nAl recibir una solicitud de reembolso:\n\nE-Soko revisará la solicitud y las pruebas que la respalden.\nPodemos comunicarnos con el vendedor para obtener información adicional.\nSe tomará una decisión dentro de los 7 días hábiles posteriores a la recepción de la solicitud.\n\n5. Resultados del reembolso\n\nSi se aprueba un reembolso:\n\nEl comprador recibirá un reembolso total o parcial, según la naturaleza del problema.\nEl reembolso se procesará utilizando el método de pago original.\nEs posible que se le solicite al comprador que devuelva el producto al vendedor. En tales casos, E-Soko proporcionará instrucciones para el proceso de devolución.\n\nSi se deniega un reembolso:\n\nE-Soko dará una explicación de la decisión.\nEl comprador puede apelar la decisión proporcionando información o evidencia adicional dentro de los 5 días hábiles posteriores a la recepción del rechazo.\n6. Responsabilidades del vendedor\n\nLos vendedores son responsables de:\n\nGarantizar que los listados de productos sean precisos y completos.\nEmpaquetar adecuadamente los productos para evitar daños durante el envío.\nAbordar cualquier problema con los compradores de manera oportuna y profesional.\n\n7. Excepciones\n\nEs posible que las siguientes situaciones no sean elegibles para reembolsos:\n\nCambio de opinión o arrepentimiento del comprador.\nProductos que sean perecederos y hayan sido abiertos o usados.\nProductos personalizados o personalizados que cumplan con las especificaciones proporcionadas.\n\n8. Contáctenos\n\nSi tiene alguna pregunta sobre nuestra Política de reembolso o necesita ayuda con una solicitud de reembolso, comuníquese con el servicio de atención al cliente de E-Soko en support@esoko.tz',
      'fr':
          'Date d\'entrée en vigueur : 24 juillet\n\n1. Vue d\'ensemble\n\nChez E-Soko, nous nous efforçons de garantir que nos acheteurs et vendeurs vivent une expérience satisfaisante. Cette politique de remboursement décrit les termes et conditions de remboursement des transactions effectuées via notre plateforme.\n\n2. Admissibilité aux remboursements\n\nLes remboursements sont généralement envisagés dans les circonstances suivantes :\n\nLe produit reçu est très différent de sa description.\nLe produit est endommagé ou gâté à l\'arrivée.\nLe produit n\'a pas été livré dans les délais convenus.\n\n3. Demander un remboursement\n\nPour demander un remboursement, les acheteurs doivent :\n\nVeuillez contacter le service client E-Soko dans les 7 jours suivant la réception du produit.\nFournissez une explication détaillée du problème et incluez toutes les preuves à l’appui, telles que des photos du produit et de son emballage.\n\n4. Processus de remboursement\n\nDès réception d\'une demande de remboursement :\n\nE-Soko examinera la demande et les preuves à l’appui.\nNous pouvons contacter le vendeur pour obtenir des informations supplémentaires.\nUne décision sera prise dans les 7 jours ouvrables suivant la réception de la demande.\n\n5. Résultats du remboursement\n\nSi un remboursement est approuvé :\n\nL\'acheteur recevra un remboursement total ou partiel, selon la nature du problème.\nLe remboursement sera traité en utilisant le mode de paiement d\'origine.\nIl pourra être demandé à l’acheteur de restituer le produit au vendeur. Dans de tels cas, E-Soko fournira des instructions pour le processus de retour.\n\nSi un remboursement est refusé :\n\nE-Soko fournira une explication sur la décision.\nL\'acheteur peut faire appel de la décision en fournissant des informations ou des preuves supplémentaires dans les 5 jours ouvrables suivant la réception du refus.\n6. Responsabilités du vendeur\n\nLes vendeurs sont responsables de :\n\nS\'assurer que les listes de produits sont exactes et complètes.\nEmballer correctement les produits pour éviter tout dommage pendant le transport.\nRésoudre tout problème avec les acheteurs en temps opportun et de manière professionnelle.\n\n7. Exceptions\n\nLes situations suivantes peuvent ne pas donner droit à un remboursement :\n\nChangement d’avis ou remords de l’acheteur.\nProduits périssables qui ont été ouverts ou utilisés.\nProduits sur mesure ou personnalisés répondant aux spécifications fournies.\n\n8. Contactez-nous\n\nSi vous avez des questions sur notre politique de remboursement ou si vous avez besoin d\'aide pour une demande de remboursement, veuillez contacter le service client d\'E-Soko à support@esoko.tz.',
      'sw':
          'Tarehe ya Kutumika: Julai 24\n\n1. Muhtasari\n\nKatika E-Soko, tunajitahidi kuhakikisha kwamba wanunuzi na wauzaji wetu wanapata uzoefu wa kuridhisha. Sera hii ya Kurejesha Fedha inabainisha sheria na masharti ya kurejesha pesa kwa miamala iliyofanywa kupitia mfumo wetu.\n\n2. Kustahiki Kurejeshewa Pesa\n\nKurejesha pesa kwa kawaida huzingatiwa chini ya hali zifuatazo:\n\nBidhaa iliyopokelewa ni tofauti sana na maelezo yake.\nBidhaa imeharibiwa au kuharibiwa wakati wa kuwasili.\nBidhaa haikuwasilishwa ndani ya muda uliokubaliwa.\n\n3. Kuomba Kurejeshewa Pesa\n\nIli kuomba kurejeshewa pesa, wanunuzi lazima:\n\nTafadhali wasiliana na usaidizi kwa wateja wa E-Soko ndani ya siku 7 baada ya kupokea bidhaa.\nToa ufafanuzi wa kina wa suala hilo na ujumuishe ushahidi wowote unaounga mkono, kama vile picha za bidhaa na ufungashaji wake.\n\n4. Mchakato wa Kurejesha Mapato\n\nBaada ya kupokea ombi la kurejeshewa pesa:\n\nE-Soko itakagua ombi na ushahidi wa kuunga mkono.\nTunaweza kuwasiliana na muuzaji kwa maelezo zaidi.\nUamuzi utafanywa ndani ya siku 7 za kazi baada ya kupokea ombi.\n\n5. Rejesha Matokeo\n\nIkiwa urejeshaji wa pesa umeidhinishwa:\n\nMnunuzi atarejeshewa pesa kamili au sehemu, kulingana na hali ya suala hilo.\nUrejeshaji wa pesa utachakatwa kwa kutumia njia asili ya kulipa.\nMnunuzi anaweza kuulizwa kurudisha bidhaa kwa muuzaji. Katika hali kama hizi, E-Soko itatoa maagizo kwa mchakato wa kurudi.\n\nIkiwa urejeshaji wa pesa umekataliwa:\n\nE-Soko itatoa ufafanuzi wa uamuzi huo.\nMnunuzi anaweza kukata rufaa dhidi ya uamuzi huo kwa kutoa maelezo ya ziada au ushahidi ndani ya siku 5 za kazi baada ya kupokea kukataliwa.\n6. Majukumu ya Muuzaji\n\nWauzaji wanawajibika kwa:\n\nKuhakikisha kuwa uorodheshaji wa bidhaa ni sahihi na kamili.\nBidhaa za ufungaji vizuri ili kuzuia uharibifu wakati wa usafirishaji.\nKushughulikia masuala yoyote na wanunuzi kwa wakati na kwa njia ya kitaaluma.\n\n7. Isipokuwa\n\nHali zifuatazo huenda zisistahiki kurejeshewa pesa:\n\nMabadiliko ya akili au majuto ya mnunuzi.\nBidhaa zinazoharibika na zimefunguliwa au kutumika.\nBidhaa maalum au za kibinafsi ambazo zinakidhi vipimo vilivyotolewa.\n\n8. Wasiliana Nasi\n\nIkiwa una maswali yoyote kuhusu Sera yetu ya Kurejeshewa Fedha au unahitaji usaidizi wa ombi la kurejeshewa pesa, tafadhali wasiliana na usaidizi kwa wateja wa E-Soko kwa support@esoko.tz',
    },
    'u9o7gben': {
      'en': 'Shipping and Delivery',
      'ar': 'كيف يتم التعامل مع المدفوعات على E-Soko؟',
      'es': '¿Cómo se manejan los pagos en E-Soko?',
      'fr': 'Comment sont gérés les paiements sur E-Soko ?',
      'sw': 'Je, malipo yanashughulikiwa vipi kwenye E-Soko?',
    },
    'u5cki287': {
      'en':
          'We offer worldwide shipping. Shipping costs and delivery times vary depending on your location and the size of the artwork.\n\nDelivery times vary based on your location and the shipping method selected. Typically, orders are processed within 2-3 business days and shipping times range from 5-15 business days. You will receive a tracking notification once your order has been shipped.\n\nOnce your order has been shipped, you will receive an email with a tracking number and instructions on how to track your package.',
      'ar':
          'تستخدم E-Soko بوابات دفع آمنة للتعامل مع المعاملات. يمكن للمشترين الدفع باستخدام طرق مختلفة، بما في ذلك بطاقات الائتمان/الخصم، والأموال عبر الهاتف المحمول، والتحويلات المصرفية. يتم تحويل الأموال إلى حساب E-Soko الخاص بك، والذي يمكنك سحبه إلى حسابك البنكي.',
      'es':
          'E-Soko utiliza pasarelas de pago seguras para gestionar las transacciones. Los compradores pueden pagar mediante varios métodos, incluidas tarjetas de crédito/débito, dinero móvil y transferencias bancarias. Los fondos se transfieren a su cuenta E-Soko, que puede retirar a su cuenta bancaria.',
      'fr':
          'E-Soko utilise des passerelles de paiement sécurisées pour gérer les transactions. Les acheteurs peuvent payer en utilisant différentes méthodes, notamment les cartes de crédit/débit, l\'argent mobile et les virements bancaires. Les fonds sont transférés sur votre compte E-Soko, que vous pouvez retirer sur votre compte bancaire.',
      'sw':
          'E-Soko hutumia lango salama la malipo kushughulikia miamala. Wanunuzi wanaweza kulipa kwa kutumia mbinu mbalimbali, ikiwa ni pamoja na kadi za mkopo/debit, pesa za rununu na uhamishaji wa fedha benki. Pesa huhamishiwa kwenye akaunti yako ya E-Soko, ambayo unaweza kutoa kwenye akaunti yako ya benki.',
    },
    'vliar4ae': {
      'en': 'Artwork and Artists',
      'ar': 'ماذا علي أن أفعل إذا واجهت مشكلة في المعاملة؟',
      'es': '¿Qué debo hacer si encuentro un problema con una transacción?',
      'fr':
          'Que dois-je faire si je rencontre un problème avec une transaction ?',
      'sw': 'Je, nifanye nini nikikumbana na tatizo na muamala?',
    },
    '9547no1z': {
      'en':
          'We carefully curate our selection of artists to ensure high-quality, unique, and culturally significant artwork. We work closely with communities and organizations to identify talented but underserved artists and provide them with the support and platform they need to reach a wider audience.\n\nYes, we offer custom commissions. If you are interested in commissioning a piece, please contact us at [insert contact email] with your requirements, and we will connect you with an artist who can bring your vision to life.\n\nYou can support the artists by purchasing their artwork, sharing their work on social media, and spreading the word about Art Fro Scentric Studios. Additionally, a portion of every sale goes directly to the artist, helping them to continue their creative endeavors.',
      'ar':
          'إذا واجهت أي مشاكل في إحدى المعاملات، فاتصل بفريق دعم العملاء لدينا من خلال قسم \"المساعدة\" في التطبيق أو موقع الويب. قم بتقديم تفاصيل المعاملة والمشكلة التي تواجهها، وسيقوم فريقنا بمساعدتك على الفور.',
      'es':
          'Si tiene algún problema con una transacción, comuníquese con nuestro equipo de atención al cliente a través de la sección \"Ayuda\" en la aplicación o el sitio web. Proporcione detalles de la transacción y el problema que enfrenta, y nuestro equipo lo ayudará de inmediato.',
      'fr':
          'Si vous rencontrez des problèmes avec une transaction, contactez notre équipe de support client via la section « Aide » sur l\'application ou le site Web. Fournissez les détails de la transaction et du problème auquel vous êtes confronté, et notre équipe vous aidera rapidement.',
      'sw':
          'Ukikumbana na matatizo yoyote katika muamala, wasiliana na timu yetu ya usaidizi kwa wateja kupitia sehemu ya \"Msaada\" kwenye programu au tovuti. Toa maelezo ya muamala na suala linalokukabili, na timu yetu itakusaidia mara moja.',
    },
    'p5eusn2y': {
      'en': 'Purchasing and Payment',
      'ar': 'كيف تضمن E-Soko جودة المنتجات؟',
      'es': '¿Cómo garantiza E-Soko la calidad de los productos?',
      'fr': 'Comment E-Soko garantit-il la qualité des produits ?',
      'sw': 'Je, E-Soko inahakikishaje ubora wa bidhaa?',
    },
    'lsy2cp6t': {
      'en':
          'Currently, we operate exclusively online. Each artwork is presented with high-quality images and detailed descriptions to help you make an informed decision. If you have any questions about a specific piece, feel free to contact us.\n\nThere is no limit to the number of pieces you can purchase. However, if you are interested in a bulk purchase for a corporate or special event, please contact us at artfroscentric@gmail.com for special arrangements.',
      'ar':
          'تشجع E-Soko البائعين على تقديم أوصاف تفصيلية وصور عالية الجودة لمنتجاتهم. يتم تشجيع المشترين أيضًا على ترك التعليقات والتقييمات، مما يساعد في الحفاظ على جودة وموثوقية القوائم على المنصة.',
      'es':
          'E-Soko anima a los vendedores a proporcionar descripciones detalladas y fotografías de alta calidad de sus productos. También se anima a los compradores a dejar reseñas y calificaciones, que ayudan a mantener la calidad y confiabilidad de los listados en la plataforma.',
      'fr':
          'E-Soko encourage les vendeurs à fournir des descriptions détaillées et des photos de haute qualité de leurs produits. Les acheteurs sont également encouragés à laisser des avis et des notes, ce qui contribue à maintenir la qualité et la fiabilité des annonces sur la plateforme.',
      'sw':
          'E-Soko inawahimiza wauzaji kutoa maelezo ya kina na picha za ubora wa juu wa bidhaa zao. Wanunuzi pia wanahimizwa kuacha ukaguzi na ukadiriaji, ambao husaidia kudumisha ubora na uaminifu wa matangazo kwenye jukwaa.',
    },
    '83rfcv9l': {
      'en': 'Custom and Commissioned Artwork',
      'ar': 'كيف أقوم بإدراج منتجاتي على E-Soko؟',
      'es': '¿Cómo publico mis productos en E-Soko?',
      'fr': 'Comment lister mes produits sur E-Soko ?',
      'sw': 'Je, ninawezaje kuorodhesha bidhaa zangu kwenye E-Soko?',
    },
    'g1cjmxxl': {
      'en':
          'The time required to complete a commissioned piece varies depending on the artist and the complexity of the work. Generally, it can take anywhere from a few weeks to a few months. We will provide you with an estimated timeline when you place your commission request.\n\nTo commission a piece of art, contact us at artfroscentric@gmail.com with your requirements and preferences. We will connect you with an artist who matches your needs. You will collaborate with the artist to finalize the details, and once agreed upon, the artist will begin working on your custom piece.',
      'ar':
          'لإدراج منتجاتك، ستحتاج أولاً إلى إنشاء حساب وتقديم معلومات الاتصال الخاصة بك. بعد ذلك، أكمل عملية التحقق، والتي تتضمن تقديم إثبات الهوية وأي وثائق تجارية ضرورية. للتحقق، اتصل بفريق دعم العملاء لدينا من خلال قسم \"المساعدة\" في التطبيق، أو راسلنا عبر البريد الإلكتروني على support@esoko.tz. بمجرد التحقق، سيتم منحك حق الوصول إلى صفحة المسؤول حيث يمكنك عرض منتجاتك وإدارتها.',
      'es':
          'Para enumerar sus productos, primero deberá crear una cuenta y proporcionar su información de contacto. Luego, complete nuestro proceso de verificación, que incluye la presentación de prueba de identidad y cualquier documentación comercial necesaria. Para verificación, comuníquese con nuestro equipo de atención al cliente a través de la sección \"Ayuda\" de la aplicación o envíenos un correo electrónico a support@esoko.tz. Una vez verificado, se le dará acceso a una página de administración donde podrá mostrar y administrar sus productos.',
      'fr':
          'Pour lister vos produits, vous devrez d’abord créer un compte et fournir vos coordonnées. Ensuite, complétez notre processus de vérification, qui comprend la soumission d\'une preuve d\'identité et de tout document commercial nécessaire. Pour vérification, contactez notre équipe de support client via la section « Aide » de l\'application, ou envoyez-nous un e-mail à support@esoko.tz. Une fois vérifié, vous aurez accès à une page d\'administration où vous pourrez afficher et gérer vos produits.',
      'sw':
          'Ili kuorodhesha bidhaa zako, kwanza, utahitaji kufungua akaunti na kutoa maelezo yako ya mawasiliano. Kisha, kamilisha mchakato wetu wa uthibitishaji, unaojumuisha kuwasilisha uthibitisho wa utambulisho na hati zozote muhimu za biashara. Kwa uthibitishaji, wasiliana na timu yetu ya usaidizi kwa wateja kupitia sehemu ya \"Msaada\" kwenye programu, au tutumie barua pepe kwa support@esoko.tz. Baada ya kuthibitishwa, utapewa ufikiaji wa ukurasa wa msimamizi ambapo unaweza kuonyesha na kudhibiti bidhaa zako.',
    },
    'k7ebt0hq': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
      'sw': 'Wasiliana nasi',
    },
    '7fls11dj': {
      'en': 'Customer Service',
      'ar': 'خدمة الزبائن',
      'es': 'Servicio al Cliente',
      'fr': 'Service client',
      'sw': 'Huduma kwa wateja',
    },
    'lijamzuk': {
      'en': 'Support',
      'ar': 'يدعم',
      'es': 'Apoyo',
      'fr': 'Soutien',
      'sw': 'Msaada',
    },
    'becflo6w': {
      'en': 'Instagram',
      'ar': 'انستغرام',
      'es': 'Instagram',
      'fr': 'Instagram',
      'sw': 'Instagram',
    },
    'dryehphj': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // CustomerSupport
  {
    'n8zkrsnu': {
      'en': 'Message...',
      'ar': 'رسالة...',
      'es': 'Mensaje...',
      'fr': 'Message...',
      'sw': 'Ujumbe...',
    },
    'u2xnl1e6': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Signup
  {
    'qoeoz6qe': {
      'en': 'Signup',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'sw': 'Jisajili',
    },
    's7bqyqpk': {
      'en': 'Create new account',
      'ar': 'انشاء حساب جديد',
      'es': 'Crear una nueva cuenta',
      'fr': 'Créer un nouveau compte',
      'sw': 'Fungua akaunti mpya',
    },
    '9bakqz1g': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'u9etdywn': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'sw': 'Nenosiri',
    },
    'u2wxlynf': {
      'en': 'Retry Password',
      'ar': 'إعادة محاولة كلمة المرور',
      'es': 'Reintentar contraseña',
      'fr': 'Réessayer le mot de passe',
      'sw': 'Jaribu tena Nenosiri',
    },
    '5akph81w': {
      'en': 'Signup',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'sw': 'Jisajili',
    },
    'z2ncl47d': {
      'en': 'Google',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'ysut8ogx': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'gpa0y73q': {
      'en': 'Give a valid e-mail address',
      'ar': 'إعطاء عنوان بريد إلكتروني صالح',
      'es': 'Proporcione una dirección de correo electrónico válida',
      'fr': 'Donnez une adresse e-mail valide',
      'sw': 'Toa anwani halali ya barua pepe',
    },
    'q9u655km': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'yha59gtw': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'yoj6raru': {
      'en': 'Password should be at least 6 characters long',
      'ar': 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل',
      'es': 'La contraseña debe tener al menos 6 caracteres',
      'fr': 'Le mot de passe doit comporter au moins 6 caractères',
      'sw': 'Nenosiri lazima liwe na urefu wa angalau vibambo 6',
    },
    '17i9h1gu': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '6nugwj54': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'hqo402f2': {
      'en': 'Password should be at least 6 characters long',
      'ar': 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل',
      'es': 'La contraseña debe tener al menos 6 caracteres',
      'fr': 'Le mot de passe doit comporter au moins 6 caractères',
      'sw': 'Nenosiri lazima liwe na urefu wa angalau vibambo 6',
    },
    '9e8matkp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '6180jgo5': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'h6dsdff0': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'sw': 'Nenosiri',
    },
    '51s8rku8': {
      'en': 'Retry Password',
      'ar': 'إعادة محاولة كلمة المرور',
      'es': 'Reintentar contraseña',
      'fr': 'Réessayer le mot de passe',
      'sw': 'Jaribu tena Nenosiri',
    },
    '6i1t0a7a': {
      'en': 'Signup',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'sw': 'Jisajili',
    },
    'g48pl01e': {
      'en': 'Google',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'm5la4p6i': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'csrupkt9': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'd8rqqv1s': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'dlo9aczs': {
      'en': 'Password should be at least 6 characters long',
      'ar': 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل',
      'es': 'La contraseña debe tener al menos 6 caracteres',
      'fr': 'Le mot de passe doit comporter au moins 6 caractères',
      'sw': 'Nenosiri lazima liwe na urefu wa angalau vibambo 6',
    },
    'aobymxzl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'h3kjvuql': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'nxd396r2': {
      'en': 'Password should be at least 6 characters long',
      'ar': 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل',
      'es': 'La contraseña debe tener al menos 6 caracteres',
      'fr': 'Le mot de passe doit comporter au moins 6 caractères',
      'sw': 'Nenosiri lazima liwe na urefu wa angalau vibambo 6',
    },
    'wnkymf0d': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    't5r24t2l': {
      'en': 'Have an account?',
      'ar': 'هل لديك حساب؟',
      'es': '¿Tener una cuenta?',
      'fr': 'Avoir un compte?',
      'sw': 'Je, una akaunti?',
    },
    '8jt08qlz': {
      'en': '  Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'sw': 'Ingia',
    },
    'ts4gp774': {
      'en': 'Have an account?',
      'ar': 'هل لديك حساب؟',
      'es': '¿Tener una cuenta?',
      'fr': 'Avoir un compte?',
      'sw': 'Je, una akaunti?',
    },
    '4qmjnsrn': {
      'en': '  Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'sw': 'Ingia',
    },
    '4kthvvdn': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // SigninwithGoogle
  {
    '0tppxrer': {
      'en': 'Google',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
  },
  // onBoardComplete_modal
  {
    'prn4cih5': {
      'en': 'Congratulations!',
      'ar': 'تهانينا!',
      'es': '¡Felicidades!',
      'fr': 'Toutes nos félicitations!',
      'sw': 'Hongera!',
    },
    '7y5lbqhc': {
      'en':
          'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
      'ar':
          'حسابك جاهز للاستخدام. ستتم إعادة توجيهك إلى الصفحة الرئيسية خلال ثوانٍ قليلة.',
      'es':
          'Su cuenta está lista para usar. Serás redirigido a la página de inicio en unos segundos.',
      'fr':
          'Votre compte est prêt à être utilisé. Vous serez redirigé vers la page d\'accueil dans quelques secondes.',
      'sw':
          'Akaunti yako iko tayari kutumika. Utaelekezwa kwenye ukurasa wa Nyumbani baada ya sekunde chache..',
    },
  },
  // ProductItem
  {
    'fquf478k': {
      'en': ' sold',
      'ar': 'مُباع',
      'es': 'vendido',
      'fr': 'vendu',
      'sw': 'kuuzwa',
    },
  },
  // RemoveFromCardConfirm
  {
    'pq99mh1o': {
      'en': 'Remove Product?',
      'ar': 'هل ترغب في إزالة المنتج؟',
      'es': '¿Quitar producto?',
      'fr': 'Supprimer le produit ?',
      'sw': 'Ungependa Kuondoa Bidhaa?',
    },
    'dhnacgix': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'sw': 'Ghairi',
    },
    'es0xob3g': {
      'en': 'Yes, Remove',
      'ar': 'نعم، إزالة',
      'es': 'Sí, eliminar',
      'fr': 'Oui, supprimer',
      'sw': 'Ndiyo, Ondoa',
    },
  },
  // OrderItem
  {
    'k5z1lp7b': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
      'sw': 'Rangi',
    },
  },
  // ShippingItemRadioBTn
  {
    'lkvkur3i': {
      'en': 'Default',
      'ar': 'تقصير',
      'es': 'Por defecto',
      'fr': 'Défaut',
      'sw': 'Chaguomsingi',
    },
  },
  // AddPromoItem
  {
    'm6adkvge': {
      'en': 'Default',
      'ar': 'تقصير',
      'es': 'Por defecto',
      'fr': 'Défaut',
      'sw': 'Chaguomsingi',
    },
  },
  // CheckOutSuccessfulModal65
  {
    'huy1t7vw': {
      'en': 'Order Successful!',
      'ar': 'تم الطلب بنجاح!',
      'es': '¡Orden exitosa!',
      'fr': 'Commande réussie !',
      'sw': 'Agizo Limefaulu!',
    },
    'onl8csfz': {
      'en': 'You have successfully made order',
      'ar': 'لقد قمت بالطلب بنجاح',
      'es': 'Has realizado el pedido correctamente',
      'fr': 'Vous avez passé commande avec succès',
      'sw': 'Umefaulu kuagiza',
    },
    '5nsud8h1': {
      'en': 'View Order',
      'ar': 'مشاهدة الطلب',
      'es': 'Ver pedido',
      'fr': 'Voir l\'ordre',
      'sw': 'Tazama Agizo',
    },
    '6pgr229g': {
      'en': 'View E-Receipt',
      'ar': 'عرض الإيصال الإلكتروني',
      'es': 'Ver recibo electrónico',
      'fr': 'Afficher le reçu électronique',
      'sw': 'Tazama Risiti ya E',
    },
  },
  // OrderOngoingItem
  {
    '5irw8aul': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
      'sw': 'Rangi',
    },
    '4tzvev7a': {
      'en': 'Leave Review',
      'ar': 'اترك مراجعة',
      'es': 'Deje opinión',
      'fr': 'Laisser un avis',
      'sw': 'Acha Ukaguzi',
    },
  },
  // ReviewGive
  {
    'b167nkp3': {
      'en': 'Leave a Review',
      'ar': 'ترك التعليق',
      'es': 'Dejar un comentario',
      'fr': 'Laisser un commentaire',
      'sw': 'Acha Mapitio',
    },
    'p4v8fyel': {
      'en': 'Please give your rating & also your review...',
      'ar': 'يرجى إعطاء تقييمك وأيضا رأيك ...',
      'es': 'Por favor dé su calificación y también su opinión...',
      'fr': 'Veuillez donner votre note et également votre avis...',
      'sw': 'Tafadhali toa ukadiriaji wako na pia ukaguzi wako...',
    },
    'j2v4qpw3': {
      'en': 'Some text like: Very good design & fast delivery!',
      'ar': 'نص Smoe مثل: منتج جيد جدًا وتسليم سريع!',
      'es': 'Smoe texto como: ¡Muy buen producto y entrega rápida!',
      'fr': 'Texte smoe comme : Très bon produit et livraison rapide !',
      'sw': 'Maandishi ya Smoe kama: Bidhaa nzuri sana na utoaji wa haraka!',
    },
    'pmb9suod': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'sw': 'Sehemu inahitajika',
    },
    'zjspktyl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'oe33acjy': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'sw': 'Ghairi',
    },
    'zs6j4hc7': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
      'es': 'Entregar',
      'fr': 'Soumettre',
      'sw': 'Wasilisha',
    },
  },
  // LogoutConfirm_Modal
  {
    'a68c7jwy': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
      'sw': 'Ondoka',
    },
    '50ivrv6h': {
      'en': 'Are you sure you want to log out?',
      'ar': 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
      'es': '¿Está seguro de que desea cerrar sesión?',
      'fr': 'Êtes-vous sûr de vouloir vous déconnecter?',
      'sw': 'Je, una uhakika unataka kutoka?',
    },
    'p0z4sjdl': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'sw': 'Ghairi',
    },
    'a6j51z22': {
      'en': 'Yes, Logout',
      'ar': 'نعم، تسجيل الخروج',
      'es': 'Sí, cerrar sesión',
      'fr': 'Oui, déconnexion',
      'sw': 'Ndiyo, Ondoka',
    },
  },
  // InfoConfirm_Modal
  {
    '82i39xhd': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'sw': 'Ghairi',
    },
    'x4zkf56d': {
      'en': 'Ok, I Undrestand!',
      'ar': 'حسنًا، أنا أفهم!',
      'es': '¡Vale, lo entiendo!',
      'fr': 'Ok, je comprends !',
      'sw': 'Sawa, Ninaelewa!',
    },
  },
  // AddressAdd
  {
    'bxpbj9fp': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'es': 'Agregar nueva dirección',
      'fr': 'Ajouter une nouvelle adresse',
      'sw': 'Ongeza Anwani Mpya',
    },
    'eb9q3bg6': {
      'en': 'Address Name',
      'ar': 'اسم عنوان',
      'es': 'Nombre de la dirección',
      'fr': 'Nom de l\'adresse',
      'sw': 'Jina la Anwani',
    },
    'frnvw3qd': {
      'en': 'Address name',
      'ar': 'اسم عنوان',
      'es': 'Nombre de la dirección',
      'fr': 'Nom de l\'adresse',
      'sw': 'Jina la anwani',
    },
    'ndpl9q5e': {
      'en': 'Address Details',
      'ar': 'تفاصيل العنوان',
      'es': 'detalles de dirección',
      'fr': 'Détails de l\'adresse',
      'sw': 'Maelezo ya Anwani',
    },
    'qb3e65w0': {
      'en': 'Select Location',
      'ar': 'اختر موقعا',
      'es': 'Seleccionar Ubicación',
      'fr': 'Sélectionnez l\'emplacement',
      'sw': 'Chagua Mahali',
    },
    '2xpzfut9': {
      'en': 'Make this as the default address',
      'ar': 'اجعل هذا هو العنوان الافتراضي',
      'es': 'Establecer esta como la dirección predeterminada',
      'fr': 'Faites-en l\'adresse par défaut',
      'sw': 'Fanya hii kama anwani chaguo-msingi',
    },
    '5d9gdpwi': {
      'en': 'Add',
      'ar': 'يضيف',
      'es': 'Agregar',
      'fr': 'Ajouter',
      'sw': 'Ongeza',
    },
  },
  // PromoAdd
  {
    'vzaa7mk1': {
      'en': 'Select your promo',
      'ar': 'حدد العرض الترويجي الخاص بك',
      'es': 'Selecciona tu promoción',
      'fr': 'Sélectionnez votre promotion',
      'sw': 'Chagua tangazo lako',
    },
    '1phps44x': {
      'en': 'Available',
      'ar': 'متاح',
      'es': 'Disponible',
      'fr': 'Disponible',
      'sw': 'Inapatikana',
    },
  },
  // Side_nav_content
  {
    'tag5efj1': {
      'en': 'Welcome.',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'w0pemd14': {
      'en': 'Support Artists',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'z5fxl2ps': {
      'en': 'Home',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'kbwrq67l': {
      'en': 'Cart',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'vyogf097': {
      'en': 'Orders',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'zdixefbt': {
      'en': 'Wish List',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'atevgw2a': {
      'en': 'Chat Support',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '3g1sbqeb': {
      'en': 'Profile',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'vqgzvhn8': {
      'en': 'Help',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'r7tqxf7n': {
      'en': 'Log Out',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'wh0ygp1g': {
      'en': 'Light Mode',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'hqwnczrz': {
      'en': 'Dark Mode',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
  },
  // Miscellaneous
  {
    '3xcyhsnv': {
      'en': 'Next',
      'ar': 'التالي',
      'es': 'Próximo',
      'fr': 'Suivant',
      'sw': 'Inayofuata',
    },
    'wdaunoqs': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    '2dwdc8yl': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
      'sw': 'Jina kamili',
    },
    '9cp9tnq9': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
      'sw': 'Mwanaume',
    },
    'r0k6dvu6': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
      'sw': 'Kike',
    },
    '3ndtzya4': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
      'sw': 'Jinsia',
    },
    'swm6319t': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'sw': 'Tafuta kipengee...',
    },
    'gpzu150f': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'sw': 'Tafuta',
    },
    'ip2a2o8v': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    '95svkunb': {
      'en': 'Clothes',
      'ar': 'ملابس',
      'es': 'Ropa',
      'fr': 'Vêtements',
      'sw': 'Nguo',
    },
    'p3v8uoen': {
      'en': 'Popular',
      'ar': 'شائع',
      'es': 'Popular',
      'fr': 'Populaire',
      'sw': 'Maarufu',
    },
    '1iw4e130': {
      'en': 'Most Recent',
      'ar': 'الأحدث',
      'es': 'Más reciente',
      'fr': 'Le plus récent',
      'sw': 'Hivi Karibuni',
    },
    'dk7ex8cx': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
      'sw': 'Weka upya',
    },
    'a5iqoo0f': {
      'en': 'Smoe text like: Very good product & fast delivery!',
      'ar': 'نص Smoe مثل: منتج جيد جدًا وتسليم سريع!',
      'es': 'Smoe texto como: ¡Muy buen producto y entrega rápida!',
      'fr': 'Texte smoe comme : Très bon produit et livraison rapide !',
      'sw': 'Maandishi ya Smoe kama: Bidhaa nzuri sana na utoaji wa haraka!',
    },
    'lkrp1j91': {
      'en': '\$10',
      'ar': '10 دولارات',
      'es': '\$10',
      'fr': '10 \$',
      'sw': '\$10',
    },
    '6mrgpbz0': {
      'en': 'Invite',
      'ar': 'يدعو',
      'es': 'Invitar',
      'fr': 'Inviter',
      'sw': 'Alika',
    },
    'kvc2fy4j': {
      'en': 'Invited',
      'ar': 'مدعو',
      'es': 'Invitado',
      'fr': 'Invité',
      'sw': 'Umealikwa',
    },
    'zwg93n13': {
      'en': '2899 Summer Drive Taylor, PC 48180',
      'ar': '2899 سمر درايف تايلور، الكمبيوتر 48180',
      'es': '2899 Verano Drive Taylor, PC 48180',
      'fr': '2899, promenade Summer Taylor, PC 48180',
      'sw': '2899 Summer Drive Taylor, PC 48180',
    },
    'b3knti0s': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'xvif1n69': {
      'en': 'Art1',
      'ar': 'الفن1',
      'es': 'Arte1',
      'fr': 'Art1',
      'sw': 'Sanaa ya 1',
    },
    '251gk4uv': {
      'en': 'Art2',
      'ar': 'الفن2',
      'es': 'Arte2',
      'fr': 'Art2',
      'sw': 'Sanaa2',
    },
    'rh97ml0k': {
      'en': 'Art3',
      'ar': 'الفن3',
      'es': 'Arte3',
      'fr': 'Art3',
      'sw': 'Sanaa ya 3',
    },
    'rtt0s3ia': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'v3sxop9c': {
      'en': '111111',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'qx03qhyp': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'yern1xc3': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'qpnabqqh': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'p22sdi5k': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'zjkwl8p2': {
      'en': 'This app requires contacts access to function properly.',
      'ar': 'يتطلب هذا التطبيق الوصول إلى جهات الاتصال ليعمل بشكل صحيح.',
      'es':
          'Esta aplicación requiere acceso a los contactos para funcionar correctamente.',
      'fr':
          'Cette application nécessite un accès aux contacts pour fonctionner correctement.',
      'sw':
          'Programu hii inahitaji ufikiaji wa anwani ili kufanya kazi vizuri.',
    },
    'd87k0ap6': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '5uwt6n9y': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'l46gqdxp': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'hxhmmu6e': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'ag0mlb7c': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'fcu9zsgb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'mi1gwhj1': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'vhpv466y': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '0tfvavw5': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'i0ayvchq': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '12fpoh0h': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'mqo0fjf7': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'pbruw4is': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '2ds938sx': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'f8wsmlub': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'aa27z1n2': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'rz28dduj': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'cq43nzjx': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'bpv17yg3': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'xw4eb2cb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'h9ohlmo6': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'expiyj8r': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'mbakdgif': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '3ystj7r4': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'y65cdfga': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
  },
].reduce((a, b) => a..addAll(b));
