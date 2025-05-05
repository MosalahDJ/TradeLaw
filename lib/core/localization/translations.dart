import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      // Authentication - Old Words
      'trade_law': 'TradeLaw',
      'email': 'Email Address',
      'enter_email': 'Enter your email address',
      'password': 'Password',
      'enter_password': 'Enter your password',
      'forgot_password': 'Forgot Password?',
      'login': 'Sign In',
      'or_login_with': 'Or Sign In With',
      'no_account': 'Don\'t have an account?',
      'sign_in': 'Register Now',
      'please_enter_email': 'Please enter your email address and password',
      'leave_login': 'Do you want to exit the sign-in process?',
      'leave_app': 'Do you want to exit TradeLaw?',
      'log_out': 'Log Out',
      'error': 'Error',
      "unknown_error": "An unknown error occurred",
      "success": "Success",
      'create_account': 'Create Your Account',
      'fill_form_title': 'Fill the form',
      'fill_form': 'Please complete the form',
      'first_name': 'First Name',
      'last_name': 'Last Name',
      'enter_first_name': 'Enter your first name',
      'enter_last_name': 'Enter your last name',
      'confirm_password': 'Confirm Password',
      'enter_confirm_password': 'Re-enter your password',
      'create_account_button': 'Create Account',
      'leave_registration': 'Do you want to exit the registration process?',
      'registration': 'Registration',
      'anonymous_user': 'Anonymous User',
      'no_email': 'No Email',

      // New Words
      'are_you_sure': 'Are you sure?',
      'yes': 'Yes',
      'no': 'No',
      'welcome_back': 'Welcome back! Glad',
      'see_you_again': 'to see you, Again!',
      'field_required': 'This field is required',
      'valid_email': 'Please enter a valid email',
      'password_length': 'Password must be at least 6 characters',
      'not_match': 'Passwords do not match',
      'hello_register': 'Hello! Register to get',
      'started': 'Started',
      'register': 'Register',
      'have_account': 'Already have an account?',
      'log_in': 'Log In',

      // Home Page
      'Dashboard': 'Dashboard',
      'Welcome': 'Welcome',
      'Explore our services': 'Explore our services',
      'english': 'English',
      'arabic': 'Arabic',
      'french': 'French',

      //pages
      'products': 'Products',
      'reporting': 'Reports',
      'report_tracking': 'My Reports',
      'law_info': 'Laws',
      'info': 'Info',
      'help&feedback': 'Help',

      // Report Types
      'Price Manipulation': 'Price Manipulation',
      'Monopoly & Speculation': 'Monopoly & Speculation',
      'Expired Products': 'Expired Products',
      'Illegal Products': 'Illegal Products',
      'Hygiene Violations': 'Hygiene Violations',
      'Other Violations': 'Other Violations',

      // Report descriptions
      'd1':
          'Report businesses that artificially increase prices or engage in unfair pricing practices.',
      'd2':
          'Report businesses hoarding products to create artificial scarcity or monopolistic practices.',
      'd3':
          'Report businesses selling products past their expiration date or with altered expiry information.',
      'd4':
          'Report the sale of prohibited, counterfeit, or unlicensed products.',
      'd5':
          'Report businesses with poor sanitation, unhygienic food handling, or unsanitary conditions.',
      'd6':
          'Report other trade law violations not covered by the categories above.',
      // Report Information Page
      'report_title': 'Report %{title}',
      'location_information': 'Location Information',
      'city': 'City',
      'enter_city_name': 'Enter city name',
      'please_enter_city_name': 'Please enter city name',
      'town_district': 'Town/District',
      'enter_town_district_name': 'Enter town or district name',
      'village_neighborhood': 'Village/Neighborhood',
      'enter_village_neighborhood_name': 'Enter village or neighborhood name',
      'market_information': 'Market Information',
      'market_store_name': 'Market/Store Name',
      'enter_market_store_name': 'Enter the name of the market or store',
      'please_enter_market_name': 'Please enter market name',
      'market_store_number': 'Market/Store Number',
      'enter_market_store_number':
          'Enter the number or identifier of the market',
      'violation_details': 'Violation Details',
      'description': 'Description',
      'provide_violation_details': 'Provide details about the violation',
      'please_provide_violation_details':
          'Please provide details about the violation',
      'submitting': 'Submitting...',
      'submit_report': 'Submit Report',
    },
    'ar': {
      // Authentication - Old Words
      'trade_law': 'TradeLaw',
      'email': 'البريد الإلكتروني',
      'enter_email': 'أدخل عنوان بريدك الإلكتروني',
      'password': 'كلمة المرور',
      'enter_password': 'أدخل كلمة المرور',
      'forgot_password': 'نسيت كلمة المرور؟',
      'login': 'تسجيل الدخول',
      'or_login_with': 'أو سجل الدخول باستخدام',
      'no_account': 'ليس لديك حساب؟',
      'sign_in': 'إنشاء حساب جديد',
      'please_enter_email': ' الرجاء إدخال البريد الإلكتروني و كلمة السر',
      'leave_login': 'هل تريد الخروج من عملية تسجيل الدخول؟',
      'leave_app': 'هل تريد الخروج من تطبيق TradeLaw؟',
      'log_out': 'تسجيل الخروج',
      'error': 'خطأ',
      "unknown_error": "حدث خطأ غير معروف",
      "success": "نجاح",
      'create_account': 'إنشاء حسابك',
      'fill_form_title': 'ملء النموذج',
      'fill_form': 'يرجى ملء النموذج ',
      'first_name': 'الاسم الأول',
      'last_name': 'اسم العائلة',
      'enter_first_name': 'أدخل اسمك الأول',
      'enter_last_name': 'أدخل اسم عائلتك',
      'confirm_password': 'تأكيد كلمة المرور',
      'enter_confirm_password': 'أدخل كلمة المرور مرة أخرى',
      'create_account_button': 'إنشاء حساب',
      'leave_registration': 'هل تريد مغادرة عملية التسجيل؟',
      'registration': 'التسجيل',
      'anonymous_user': 'مستخدم مجهول',
      'no_email': 'لا يوجد بريد إلكتروني',

      // New Words
      'are_you_sure': 'هل أنت متأكد؟',
      'yes': 'نعم',
      'no': 'لا',
      'welcome_back': 'مرحبًا بعودتك!',
      'see_you_again': 'سعداء برؤيتك مجددًا!',
      'field_required': 'هذا الحقل مطلوب',
      'valid_email': 'الرجاء إدخال بريد إلكتروني صحيح',
      'password_length': 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
      'not_match': 'كلمات المرور غير متطابقة',
      'hello_register': 'مرحبًا! سجل للحصول',
      'started': 'على حسابك الجديد',
      'register': 'تسجيل',
      'have_account': 'لديك حساب بالفعل؟',
      'log_in': 'تسجيل الدخول',

      // Home Page
      'Dashboard': 'لوحة التحكم',
      'Welcome': 'مرحباً',
      'Explore our services': 'استكشف خدماتنا',
      'english': 'الإنجليزية',
      'arabic': 'العربية',
      'french': 'الفرنسية',

      //pages
      'products': 'المنتجات',
      'reporting': 'البلاغات',
      'report_tracking': 'بلاغاتي',
      'law_info': 'القوانين',
      'info': 'معلومات',
      'help&fedback': 'المساعدة',

      // Report Types
      'Price Manipulation': 'التلاعب بالأسعار',
      'Monopoly & Speculation': 'الاحتكار والمضاربة',
      'Expired Products': 'منتجات منتهية الصلاحية',
      'Illegal Products': 'منتجات غير قانونية',
      'Hygiene Violations': 'مخالفات النظافة',
      'Other Violations': 'مخالفات أخرى',

      // Report descriptions
      'd1':
          'الإبلاغ عن الشركات التي ترفع الأسعار بشكل مصطنع أو تمارس سياسات تسعير غير عادلة.',
      'd2':
          'الإبلاغ عن الشركات التي تخزن المنتجات لخلق ندرة مصطنعة أو ممارسات احتكارية.',
      'd3':
          'الإبلاغ عن الشركات التي تبيع منتجات بعد تاريخ انتهاء صلاحيتها أو بمعلومات انتهاء صلاحية معدلة.',
      'd4': 'الإبلاغ عن بيع منتجات محظورة أو مزيفة أو غير مرخصة.',
      'd5':
          'الإبلاغ عن الشركات ذات النظافة السيئة أو التعامل غير الصحي مع الطعام أو الظروف غير الصحية.',
      'd6':
          'الإبلاغ عن انتهاكات أخرى لقانون التجارة غير مشمولة بالفئات المذكورة أعلاه.',
      // Report Information Page
      'report_title': 'الإبلاغ عن %{title}',
      'location_information': 'معلومات الموقع',
      'city': 'المدينة',
      'enter_city_name': 'أدخل اسم المدينة',
      'please_enter_city_name': 'الرجاء إدخال اسم المدينة',
      'town_district': 'البلدة/المنطقة',
      'enter_town_district_name': 'أدخل اسم البلدة أو المنطقة',
      'village_neighborhood': 'القرية/الحي',
      'enter_village_neighborhood_name': 'أدخل اسم القرية أو الحي',
      'market_information': 'معلومات السوق',
      'market_store_name': 'اسم السوق/المتجر',
      'enter_market_store_name': 'أدخل اسم السوق أو المتجر',
      'please_enter_market_name': 'الرجاء إدخال اسم السوق',
      'market_store_number': 'رقم السوق/المتجر',
      'enter_market_store_number': 'أدخل رقم أو معرف السوق',
      'violation_details': 'تفاصيل المخالفة',
      'description': 'الوصف',
      'provide_violation_details': 'قدم تفاصيل عن المخالفة',
      'please_provide_violation_details': 'الرجاء تقديم تفاصيل عن المخالفة',
      'submitting': 'جاري الإرسال...',
      'submit_report': 'إرسال البلاغ',
    },
    'fr': {
      // Authentication - Old Words
      'trade_law': 'TradeLaw',
      'email': 'Adresse e-mail',
      'enter_email': 'Saisissez votre adresse e-mail',
      'password': 'Mot de passe',
      'enter_password': 'Saisissez votre mot de passe',
      'forgot_password': 'Mot de passe oublié ?',
      'login': 'Se connecter',
      'or_login_with': 'Ou connectez-vous avec',
      'no_account': 'Vous n\'avez pas de compte ?',
      'sign_in': 'Créer un compte',
      'please_enter_email':
          'Veuillez saisir votre adresse e-mail et votre mot de passe',
      'leave_login': 'Voulez-vous quitter le processus de connexion ?',
      'leave_app': 'Voulez-vous quitter l\'application TradeLaw ?',
      'log_out': 'Déconnexion',
      'error': 'Erreur',
      "unknown_error": "Une erreur inconnue s'est produite",
      "success": "Succès",
      'create_account': 'Créez votre compte',
      'fill_form_title': 'remplir le formulaire',
      'fill_form': 'Veuillez remplir le formulaire',
      'first_name': 'Prénom',
      'last_name': 'Nom',
      'enter_first_name': 'Entrez votre prénom',
      'enter_last_name': 'Entrez votre nom',
      'confirm_password': 'Confirmer le mot de passe',
      'enter_confirm_password': 'Entrez à nouveau votre mot de passe',
      'create_account_button': 'Créer un compte',
      'leave_registration': 'Voulez-vous quitter le processus d\'inscription?',
      'registration': 'Inscription',
      'anonymous_user': 'Utilisateur anonyme',
      'no_email': 'Pas d\'email',

      // New Words
      'are_you_sure': 'Êtes-vous sûr?',
      'yes': 'Oui',
      'no': 'Non',
      'welcome_back': 'Bon retour! Heureux',
      'see_you_again': 'de vous revoir!',
      'field_required': 'Ce champ est obligatoire',
      'valid_email': 'Veuillez entrer un email valide',
      'password_length': 'Le mot de passe doit comporter au moins 6 caractères',
      'not_match': 'Les mots de passe ne correspondent pas',
      'hello_register': 'Bonjour! Inscrivez-vous pour',
      'started': 'commencer',
      'register': 'S\'inscrire',
      'have_account': 'Vous avez déjà un compte?',
      'log_in': 'Se connecter',
      // Home Page
      'Dashboard': 'Tableau de bord',
      'Welcome': 'Bienvenue',
      'Explore our services': 'Explorez nos services',
      'english': 'Anglais',
      'arabic': 'Arabe',
      'french': 'Francais',

      //pages
      'products': 'Produits',
      'reporting': 'Rapports',
      'report_tracking': 'Mes Rapports',
      'law_info': 'Lois',
      'info': 'Info',
      'help&fedback': 'Aide',

      // Report Types
      'Price Manipulation': 'Manipulation des prix',
      'Monopoly & Speculation': 'Monopole et spéculation',
      'Expired Products': 'Produits expirés',
      'Illegal Products': 'Produits illégaux',
      'Hygiene Violations': 'Violations d\'hygiène',
      'Other Violations': 'Autres violations',

      // Report descriptions
      'd1':
          'Signalez les entreprises qui augmentent artificiellement les prix ou se livrent à des pratiques de prix déloyales.',
      'd2':
          'Signalez les entreprises qui accumulent des produits pour créer une rareté artificielle ou des pratiques monopolistiques.',
      'd3':
          'Signalez les entreprises qui vendent des produits après leur date d\'expiration ou avec des informations d\'expiration modifiées.',
      'd4':
          'Signalez la vente de produits interdits, contrefaits ou sans licence.',
      'd5':
          'Signalez les entreprises avec une mauvaise hygiène, une manipulation non hygiénique des aliments ou des conditions insalubres.',
      'd6':
          'Signalez d\'autres violations de la loi commerciale non couvertes par les catégories ci-dessus.',
      // Report Information Page
      'report_title': 'Signaler %{title}',
      'location_information': 'Informations sur l\'emplacement',
      'city': 'Ville',
      'enter_city_name': 'Entrez le nom de la ville',
      'please_enter_city_name': 'Veuillez entrer le nom de la ville',
      'town_district': 'Commune/District',
      'enter_town_district_name': 'Entrez le nom de la commune ou du district',
      'village_neighborhood': 'Village/Quartier',
      'enter_village_neighborhood_name':
          'Entrez le nom du village ou du quartier',
      'market_information': 'Informations sur le marché',
      'market_store_name': 'Nom du marché/magasin',
      'enter_market_store_name': 'Entrez le nom du marché ou du magasin',
      'please_enter_market_name': 'Veuillez entrer le nom du marché',
      'market_store_number': 'Numéro du marché/magasin',
      'enter_market_store_number':
          'Entrez le numéro ou l\'identifiant du marché',
      'violation_details': 'Détails de la violation',
      'description': 'Description',
      'provide_violation_details': 'Fournissez des détails sur la violation',
      'please_provide_violation_details':
          'Veuillez fournir des détails sur la violation',
      'submitting': 'Soumission en cours...',
      'submit_report': 'Soumettre le rapport',
    },
  };
}
