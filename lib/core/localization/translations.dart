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
      // Products Card Translations
      'our_products': 'Our Products',
      'explore_services_products':
          'Explore our professional services and products',
      'professional_legal_services': 'Professional Legal Services',
      'access_legal_suite':
          'Access our comprehensive suite of legal products and services designed for businesses and individuals.',
      'explore_products': 'Explore Products',

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
      'report': 'Report',
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

      // Report Tracking
      'tracking_detail': 'Report Details',
      'report_not_found': 'Report not found',
      'location': 'Location',
      'submitted_on': 'Submitted on',
      'reported_by': 'Reported by',
      'tracking_progress': 'Tracking Progress',
      'view_details': 'View Details',
      'no_reports': 'No reports found',

      // Report Status
      'Under Review': 'Under Review',
      'Investigating': 'Investigating',
      'Resolved': 'Resolved',
      'Closed': 'Closed',
      'Submitted': 'Submitted',
      'Under Investigation': 'Under Investigation',
      'Rejected': 'Rejected',

      // Info Page
      'latest_trade_law_news': 'Latest Trade Law News',
      'read_more': 'Read More',
      'view_report': 'View Report',
      'new_data_privacy_law': 'New Data Privacy Law in Effect',
      'new_legislation_ip': 'New Legislation on Counterfeiting and IP',
      'new_digital_strategy': 'New Digital Strategy Through 2029',
      'data_privacy_content':
          'Algeria has established a legal framework for data privacy through Law No. 18-07, enacted on June 10, 2018, which officially came into force on August 10, 2023. This law aims to protect personal data in digital transactions and services.',
      'ip_legislation_content':
          'The Algerian government is drafting new legislation on counterfeiting and intellectual property to improve enforcement and interagency coordination. Since March 2023, the government has also worked with WIPO to draft a national IP Strategy, expected to be completed by the end of 2024.',
      'digital_strategy_content':
          'Algeria has prepared a new digital strategy extending through 2029, built on improvement of the forthcoming digitalization law and enhanced cybersecurity. This strategy is expected to create a conducive environment for innovation and economic growth. Algeria\'s High Commission of Digitization (HCD) oversees the implementation of digital policies.',

      // Help and Feedback Page
      'contact_information': 'Contact Information',
      'phone': 'Phone',
      'address': 'Address',
      'working_hours': 'Working Hours',
      'emergency_contacts': 'Emergency Contacts',
      'consumer_protection_hotline': 'Consumer Protection Hotline',
      'trade_fraud_reporting': 'Trade Fraud Reporting',
      'social_media': 'Social Media',
      'facebook': 'Facebook',
      'telegram': 'Telegram',
      'website': 'Website',
      'developer_social': 'Developer Social',
      'instagram': 'Instagram',

      // Law Info Page
      'algerian_trade_laws': 'Algerian Trade Laws',
      'consumer_protection_law': 'Consumer Protection Law 09-03',
      'price_regulation_law': 'Price Regulation Law 10-06',
      'ecommerce_law': 'E-Commerce Law 18-05',
      'intellectual_property_protection': 'Intellectual Property Protection',
      'import_regulations': 'Import Regulations',
      'article_1': 'Article 1',
      'article_2': 'Article 2',
      'article_3': 'Article 3',
      'article_4': 'Article 4',
      'article_5': 'Article 5',
      'article_6': 'Article 6',
      'article_7': 'Article 7',
      'article_8': 'Article 8',
      'article_10': 'Article 10',
      'article_11': 'Article 11',
      'article_12': 'Article 12',
      'article_17': 'Article 17',
      'article_18': 'Article 18',
      'article_1_ipr': 'Article 1 (IPR Framework)',
      'article_1_import': 'Article 1 (Import Control)',
      'consumer_protection_article_1_desc':
          'Establishes general rules for consumer protection and fraud suppression in goods and services.',
      'consumer_protection_article_2_desc':
          'Defines a consumer as any natural or legal person who acquires or uses goods or services for non-professional purposes.',
      'consumer_protection_article_3_desc':
          'Requires that all products must be safe for consumer health and safety under normal or reasonably foreseeable conditions of use.',
      'consumer_protection_article_17_desc':
          'Prohibits the sale of counterfeit goods and services that violate commercial norms and rules of fairness.',
      'consumer_protection_article_18_desc':
          'Mandates that products must conform to the standards defined in the Codex Alimentarius for food products.',
      'price_regulation_article_1_desc':
          'Allows the government to set price controls on consumer goods and services to curb inflation and protect purchasing power.',
      'price_regulation_article_2_desc':
          'Establishes mechanisms for monitoring and regulating market prices of essential goods.',
      'price_regulation_article_5_desc':
          'Provides for subsidies on several consumer items including sugar, milk, water, petrol, diesel, and flour.',
      'price_regulation_article_8_desc':
          'Prohibits unjustified price increases and speculative practices that affect consumer purchasing power.',
      'ecommerce_article_1_desc':
          'Organizes e-commerce activity with a focus on protecting consumers in electronic transactions.',
      'ecommerce_article_6_desc':
          'Requires e-suppliers to send consumers an electronic copy of the contract and invoice in accordance with Algerian law.',
      'ecommerce_article_10_desc':
          'Mandates obtaining consumer consent before collecting personal data and guaranteeing system security and data confidentiality.',
      'ecommerce_article_12_desc':
          'Regulates electronic advertising and prohibits commercial prospection by email without prior consent.',
      'ipr_article_1_desc':
          'Establishes the legal framework for intellectual property rights protection in Algeria.',
      'ipr_article_4_desc':
          'Requires IP rights holders to register and seek enforcement of their rights under local laws, as foreign registrations are not automatically recognized.',
      'ipr_article_7_desc':
          'Prohibits counterfeiting of products, especially in cosmetics, clothing, shoes, electrical appliances, and consumer and food products.',
      'ipr_article_11_desc':
          'Provides for coordination between customs authorities and law enforcement to combat counterfeit merchandise.',
      'import_article_1_desc':
          'Bans the import of firearms, explosives, narcotics, certain pharmaceutical products, used equipment, GMO seeds, and pork products.',
      'import_article_3_desc':
          'Requires that imported food products must have at least 80% of their remaining shelf life upon arrival in Algeria.',
      'import_article_5_desc':
          'Establishes temporary duties between 30% and 200% applicable to certain import operations.',
      'import_article_8_desc':
          'Implements phyto-sanitary and sanitary control regulations for imported products.',
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
      // Products Card Translations
      'our_products': 'منتجاتنا',
      'explore_services_products': 'استكشف خدماتنا ومنتجاتنا المهنية',
      'professional_legal_services': 'الخدمات القانونية المهنية',
      'access_legal_suite':
          'الوصول إلى مجموعتنا الشاملة من المنتجات والخدمات القانونية المصممة للشركات والأفراد.',
      'explore_products': 'استكشف المنتجات',

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
      'report': 'الإبلاغ عن',
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

      // Report Tracking
      'tracking_detail': 'تفاصيل البلاغ',
      'report_not_found': 'لم يتم العثور على البلاغ',
      'location': 'الموقع',
      'submitted_on': 'تم التقديم في',
      'reported_by': 'تم الإبلاغ بواسطة',
      'tracking_progress': 'تتبع التقدم',
      'view_details': 'عرض التفاصيل',
      'no_reports': 'لا توجد بلاغات',

      // Report Status
      'Under Review': 'قيد المراجعة',
      'Investigating': 'قيد التحقيق',
      'Resolved': 'تم الحل',
      'Closed': 'مغلق',
      'Submitted': 'تم التقديم',
      'Under Investigation': 'قيد التحقيق',
      'Rejected': 'مرفوض',

      // Info Page
      'latest_trade_law_news': 'أحدث أخبار قانون التجارة',
      'read_more': 'قراءة المزيد',
      'view_report': 'عرض التقرير',
      'new_data_privacy_law': 'قانون جديد لحماية البيانات ساري المفعول',
      'new_legislation_ip': 'تشريع جديد بشأن التزوير والملكية الفكرية',
      'new_digital_strategy': 'استراتيجية رقمية جديدة حتى عام 2029',
      'data_privacy_content':
          'وضعت الجزائر إطارًا قانونيًا لحماية البيانات من خلال القانون رقم 18-07، الذي تم سنه في 10 يونيو 2018، والذي دخل رسميًا حيز التنفيذ في 10 أغسطس 2023. يهدف هذا القانون إلى حماية البيانات الشخصية في المعاملات والخدمات الرقمية.',
      'ip_legislation_content':
          'تعمل الحكومة الجزائرية على صياغة تشريع جديد بشأن التزوير والملكية الفكرية لتحسين التنفيذ والتنسيق بين الوكالات. منذ مارس 2023، عملت الحكومة أيضًا مع المنظمة العالمية للملكية الفكرية لصياغة استراتيجية وطنية للملكية الفكرية، من المتوقع أن تكتمل بحلول نهاية عام 2024.',
      'digital_strategy_content':
          'أعدت الجزائر استراتيجية رقمية جديدة تمتد حتى عام 2029، مبنية على تحسين قانون الرقمنة المرتقب وتعزيز الأمن السيبراني. من المتوقع أن تخلق هذه الاستراتيجية بيئة مواتية للابتكار والنمو الاقتصادي. تشرف المفوضية العليا للرقمنة في الجزائر على تنفيذ السياسات الرقمية.',

      // Help and Feedback Page
      'contact_information': 'معلومات الاتصال',
      'phone': 'الهاتف',
      'address': 'العنوان',
      'working_hours': 'ساعات العمل',
      'emergency_contacts': 'جهات اتصال للطوارئ',
      'consumer_protection_hotline': 'الخط الساخن لحماية المستهلك',
      'trade_fraud_reporting': 'الإبلاغ عن الاحتيال التجاري',
      'social_media': 'وسائل التواصل الاجتماعي',
      'facebook': 'فيسبوك',
      'telegram': 'تيليجرام',
      'website': 'الموقع الإلكتروني',
      'developer_social': 'وسائل التواصل للمطور',
      'instagram': 'إنستغرام',

      // Law Info Page
      'algerian_trade_laws': 'قوانين التجارة الجزائرية',
      'consumer_protection_law': 'قانون حماية المستهلك 09-03',
      'price_regulation_law': 'قانون تنظيم الأسعار 10-06',
      'ecommerce_law': 'قانون التجارة الإلكترونية 18-05',
      'intellectual_property_protection': 'حماية الملكية الفكرية',
      'import_regulations': 'لوائح الاستيراد',
      'article_1': 'المادة 1',
      'article_2': 'المادة 2',
      'article_3': 'المادة 3',
      'article_4': 'المادة 4',
      'article_5': 'المادة 5',
      'article_6': 'المادة 6',
      'article_7': 'المادة 7',
      'article_8': 'المادة 8',
      'article_10': 'المادة 10',
      'article_11': 'المادة 11',
      'article_12': 'المادة 12',
      'article_17': 'المادة 17',
      'article_18': 'المادة 18',
      'article_1_ipr': 'المادة 1 (إطار حقوق الملكية الفكرية)',
      'article_1_import': 'المادة 1 (مراقبة الاستيراد)',
      'consumer_protection_article_1_desc':
          'يضع قواعد عامة لحماية المستهلك وقمع الغش في السلع والخدمات.',
      'consumer_protection_article_2_desc':
          'يعرّف المستهلك بأنه أي شخص طبيعي أو اعتباري يقتني أو يستخدم سلعًا أو خدمات لأغراض غير مهنية.',
      'consumer_protection_article_3_desc':
          'يشترط أن تكون جميع المنتجات آمنة لصحة وسلامة المستهلك في ظل ظروف الاستخدام العادية أو المتوقعة بشكل معقول.',
      'consumer_protection_article_17_desc':
          'يحظر بيع السلع والخدمات المقلدة التي تنتهك المعايير التجارية وقواعد النزاهة.',
      'consumer_protection_article_18_desc':
          'يلزم بأن تتوافق المنتجات مع المعايير المحددة في دستور الأغذية للمنتجات الغذائية.',
      'price_regulation_article_1_desc':
          'يسمح للحكومة بوضع ضوابط للأسعار على السلع والخدمات الاستهلاكية للحد من التضخم وحماية القوة الشرائية.',
      'price_regulation_article_2_desc':
          'يضع آليات لمراقبة وتنظيم أسعار السوق للسلع الأساسية.',
      'price_regulation_article_5_desc':
          'ينص على تقديم إعانات على العديد من السلع الاستهلاكية بما في ذلك السكر والحليب والماء والبنزين والديزل والدقيق.',
      'price_regulation_article_8_desc':
          'يحظر الزيادات غير المبررة في الأسعار والممارسات المضاربة التي تؤثر على القوة الشرائية للمستهلك.',
      'ecommerce_article_1_desc':
          'ينظم نشاط التجارة الإلكترونية مع التركيز على حماية المستهلكين في المعاملات الإلكترونية.',
      'ecommerce_article_6_desc':
          'يتطلب من موردي الخدمات الإلكترونية إرسال نسخة إلكترونية من العقد والفاتورة للمستهلكين وفقًا للقانون الجزائري.',
      'ecommerce_article_10_desc':
          'يلزم بالحصول على موافقة المستهلك قبل جمع البيانات الشخصية وضمان أمن النظام وسرية البيانات.',
      'ecommerce_article_12_desc':
          'ينظم الإعلانات الإلكترونية ويحظر الاستكشاف التجاري عبر البريد الإلكتروني دون موافقة مسبقة.',
      'ipr_article_1_desc':
          'يضع الإطار القانوني لحماية حقوق الملكية الفكرية في الجزائر.',
      'ipr_article_4_desc':
          'يتطلب من أصحاب حقوق الملكية الفكرية تسجيل وطلب إنفاذ حقوقهم بموجب القوانين المحلية، حيث لا يتم الاعتراف تلقائيًا بالتسجيلات الأجنبية.',
      'ipr_article_7_desc':
          'يحظر تزوير المنتجات، خاصة في مستحضرات التجميل والملابس والأحذية والأجهزة الكهربائية والمنتجات الاستهلاكية والغذائية.',
      'ipr_article_11_desc':
          'ينص على التنسيق بين سلطات الجمارك وإنفاذ القانون لمكافحة البضائع المقلدة.',
      'import_article_1_desc':
          'يحظر استيراد الأسلحة النارية والمتفجرات والمخدرات وبعض المنتجات الصيدلانية والمعدات المستعملة وبذور الكائنات المعدلة وراثيًا ومنتجات لحم الخنزير.',
      'import_article_3_desc':
          'يشترط أن يكون لدى المنتجات الغذائية المستوردة ما لا يقل عن 80٪ من مدة صلاحيتها المتبقية عند وصولها إلى الجزائر.',
      'import_article_5_desc':
          'يضع رسومًا مؤقتة بين 30٪ و 200٪ تنطبق على عمليات استيراد معينة.',
      'import_article_8_desc':
          'ينفذ لوائح الرقابة الصحية النباتية والصحية للمنتجات المستوردة.',
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
      // Products Card Translations
      'our_products': 'Nos Produits',
      'explore_services_products':
          'Explorez nos services et produits professionnels',
      'professional_legal_services': 'Services Juridiques Professionnels',
      'access_legal_suite':
          'Accédez à notre gamme complète de produits et services juridiques conçus pour les entreprises et les particuliers.',
      'explore_products': 'Explorer les Produits',

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
      'report': 'Signaler',
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

      // Report Tracking
      'tracking_detail': 'Détails du rapport',
      'report_not_found': 'Rapport non trouvé',
      'location': 'Emplacement',
      'submitted_on': 'Soumis le',
      'reported_by': 'Signalé par',
      'tracking_progress': 'Suivi de progression',
      'view_details': 'Voir les détails',
      'no_reports': 'Aucun rapport trouvé',

      // Report Status
      'Under Review': 'En cours de révision',
      'Investigating': 'En cours d\'enquête',
      'Resolved': 'Résolu',
      'Closed': 'Fermé',
      'Submitted': 'Soumis',
      'Under Investigation': 'Sous enquête',
      'Rejected': 'Rejeté',

      // Info Page
      'latest_trade_law_news': 'Dernières Actualités du Droit Commercial',
      'read_more': 'Lire Plus',
      'view_report': 'Voir le Rapport',
      'new_data_privacy_law':
          'Nouvelle Loi sur la Protection des Données en Vigueur',
      'new_legislation_ip': 'Nouvelle Législation sur la Contrefaçon et la PI',
      'new_digital_strategy': 'Nouvelle Stratégie Numérique Jusqu\'en 2029',
      'data_privacy_content':
          'L\'Algérie a établi un cadre juridique pour la protection des données à travers la Loi n° 18-07, promulguée le 10 juin 2018, qui est officiellement entrée en vigueur le 10 août 2023. Cette loi vise à protéger les données personnelles dans les transactions et services numériques.',
      'ip_legislation_content':
          'Le gouvernement algérien élabore une nouvelle législation sur la contrefaçon et la propriété intellectuelle pour améliorer l\'application et la coordination interagences. Depuis mars 2023, le gouvernement a également travaillé avec l\'OMPI pour élaborer une stratégie nationale de PI, qui devrait être achevée d\'ici fin 2024.',
      'digital_strategy_content':
          'L\'Algérie a préparé une nouvelle stratégie numérique s\'étendant jusqu\'en 2029, basée sur l\'amélioration de la future loi sur la numérisation et le renforcement de la cybersécurité. Cette stratégie devrait créer un environnement propice à l\'innovation et à la croissance économique. La Haute Commission de la Numérisation de l\'Algérie supervise la mise en œuvre des politiques numériques.',

      // Help and Feedback Page
      'contact_information': 'Informations de Contact',
      'phone': 'Téléphone',
      'address': 'Adresse',
      'working_hours': 'Heures d\'Ouverture',
      'emergency_contacts': 'Contacts d\'Urgence',
      'consumer_protection_hotline':
          'Ligne d\'Assistance Protection des Consommateurs',
      'trade_fraud_reporting': 'Signalement de Fraude Commerciale',
      'social_media': 'Réseaux Sociaux',
      'facebook': 'Facebook',
      'telegram': 'Telegram',
      'website': 'Site Web',
      'developer_social': 'Réseaux Sociaux du Développeur',
      'instagram': 'Instagram',

      // Law Info Page
      'algerian_trade_laws': 'Lois Commerciales Algériennes',
      'consumer_protection_law': 'Loi de Protection du Consommateur 09-03',
      'price_regulation_law': 'Loi de Régulation des Prix 10-06',
      'ecommerce_law': 'Loi sur le Commerce Électronique 18-05',
      'intellectual_property_protection':
          'Protection de la Propriété Intellectuelle',
      'import_regulations': 'Réglementations d\'Importation',
      'article_1': 'Article 1',
      'article_2': 'Article 2',
      'article_3': 'Article 3',
      'article_4': 'Article 4',
      'article_5': 'Article 5',
      'article_6': 'Article 6',
      'article_7': 'Article 7',
      'article_8': 'Article 8',
      'article_10': 'Article 10',
      'article_11': 'Article 11',
      'article_12': 'Article 12',
      'article_17': 'Article 17',
      'article_18': 'Article 18',
      'article_1_ipr': 'Article 1 (Cadre de la PI)',
      'article_1_import': 'Article 1 (Contrôle des Importations)',
      'consumer_protection_article_1_desc':
          'Établit des règles générales pour la protection des consommateurs et la répression des fraudes dans les biens et services.',
      'consumer_protection_article_2_desc':
          'Définit un consommateur comme toute personne physique ou morale qui acquiert ou utilise des biens ou services à des fins non professionnelles.',
      'consumer_protection_article_3_desc':
          'Exige que tous les produits soient sûrs pour la santé et la sécurité des consommateurs dans des conditions normales ou raisonnablement prévisibles d\'utilisation.',
      'consumer_protection_article_17_desc':
          'Interdit la vente de biens et services contrefaits qui violent les normes commerciales et les règles d\'équité.',
      'consumer_protection_article_18_desc':
          'Exige que les produits soient conformes aux normes définies dans le Codex Alimentarius pour les produits alimentaires.',
      'price_regulation_article_1_desc':
          'Permet au gouvernement de fixer des contrôles de prix sur les biens et services de consommation pour freiner l\'inflation et protéger le pouvoir d\'achat.',
      'price_regulation_article_2_desc':
          'Établit des mécanismes de surveillance et de régulation des prix du marché des biens essentiels.',
      'price_regulation_article_5_desc':
          'Prévoit des subventions sur plusieurs articles de consommation, notamment le sucre, le lait, l\'eau, l\'essence, le diesel et la farine.',
      'price_regulation_article_8_desc':
          'Interdit les augmentations de prix injustifiées et les pratiques spéculatives qui affectent le pouvoir d\'achat des consommateurs.',
      'ecommerce_article_1_desc':
          'Organise l\'activité du commerce électronique en mettant l\'accent sur la protection des consommateurs dans les transactions électroniques.',
      'ecommerce_article_6_desc':
          'Exige que les fournisseurs électroniques envoient aux consommateurs une copie électronique du contrat et de la facture conformément à la loi algérienne.',
      'ecommerce_article_10_desc':
          'Exige l\'obtention du consentement du consommateur avant de collecter des données personnelles et garantit la sécurité du système et la confidentialité des données.',
      'ecommerce_article_12_desc':
          'Réglemente la publicité électronique et interdit la prospection commerciale par e-mail sans consentement préalable.',
      'ipr_article_1_desc':
          'Établit le cadre juridique de la protection des droits de propriété intellectuelle en Algérie.',
      'ipr_article_4_desc':
          'Exige que les titulaires de droits de PI enregistrent et demandent l\'application de leurs droits en vertu des lois locales, car les enregistrements étrangers ne sont pas automatiquement reconnus.',
      'ipr_article_7_desc':
          'Interdit la contrefaçon de produits, notamment dans les cosmétiques, les vêtements, les chaussures, les appareils électriques, et les produits de consommation et alimentaires.',
      'ipr_article_11_desc':
          'Prévoit une coordination entre les autorités douanières et les forces de l\'ordre pour lutter contre les marchandises contrefaites.',
      'import_article_1_desc':
          'Interdit l\'importation d\'armes à feu, d\'explosifs, de stupéfiants, de certains produits pharmaceutiques, d\'équipements usagés, de semences OGM et de produits à base de porc.',
      'import_article_3_desc':
          'Exige que les produits alimentaires importés aient au moins 80% de leur durée de conservation restante à leur arrivée en Algérie.',
      'import_article_5_desc':
          'Établit des droits temporaires entre 30% et 200% applicables à certaines opérations d\'importation.',
      'import_article_8_desc':
          'Met en œuvre des réglementations de contrôle phytosanitaire et sanitaire pour les produits importés.',
    },
  };
}
